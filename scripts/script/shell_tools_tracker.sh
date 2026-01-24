#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# Shell Tools Tracker
# Cross-platform, minimal shell startup pollution, GUI/TUI aware, YAML log
# ------------------------------------------------------------------------------

# Prevent multiple sourcing
[[ -n "$TOOLS_WRAPPER_LOADED" ]] && return
export TOOLS_WRAPPER_LOADED=1

CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}"
TOOLS_LOG="$CACHE_DIR/shell_missing.yaml"
TOOLS_IGNORE="$CACHE_DIR/shell_missing.ignore"
LAST_NOTIFY="$CACHE_DIR/shell_tools_last_notify"

mkdir -p "$CACHE_DIR"

# ------------------------------------------------------------------------------
# Tool Preferences
# Format: "tool_type:space_separated_candidates"
# tool_type can be gui or tui
# ------------------------------------------------------------------------------
declare -A TOOLS_PREF=(
  [browser]="gui:zen-browser firefox firefox-esr chromium"
  [file_manager]="gui:pcmanfm nautilus dolphin"
  [cli_file_manager]="tui:yazi"
  [editor]="tui:nvim vim vi"
  [shell_enhancer]="tui:zoxide wal eza expac grep fzt git wpctl"
  [terminal]="gui:kitty alacritty gnome-terminal xterm"
)

# Detect OS/package manager
if command -v apt >/dev/null 2>&1; then
  PKG_MANAGER="apt"
elif command -v pacman >/dev/null 2>&1; then
  PKG_MANAGER="pacman"
elif command -v dnf >/dev/null 2>&1; then
  PKG_MANAGER="dnf"
elif command -v pkg >/dev/null 2>&1; then
  PKG_MANAGER="pkg"
elif command -v brew >/dev/null 2>&1; then
  PKG_MANAGER="brew"
else
  PKG_MANAGER="manual"
fi

# ------------------------------------------------------------------------------
# Helpers
# ------------------------------------------------------------------------------
command_exists() { command -v "$1" >/dev/null 2>&1; }

# Load ignore list
if [[ -f "$TOOLS_IGNORE" ]]; then
  mapfile -t IGNORED_TOOLS < "$TOOLS_IGNORE"
else
  IGNORED_TOOLS=()
fi

is_ignored() {
  local t=$1
  for i in "${IGNORED_TOOLS[@]}"; do [[ $i == "$t" ]] && return 0; done
  return 1
}

# ------------------------------------------------------------------------------
# Detect GUI session
# ------------------------------------------------------------------------------
is_gui() { [[ -n $DISPLAY || -n $WAYLAND_DISPLAY ]]; }

# ------------------------------------------------------------------------------
# Build missing tools list
# ------------------------------------------------------------------------------
update_missing_tools_log() {
  local missing=()
  for tool in "${!TOOLS_PREF[@]}"; do
    local type candidates found=""
    type=${TOOLS_PREF[$tool]%%:*}
    candidates=${TOOLS_PREF[$tool]#*:}

    # Skip GUI tools if not in GUI session
    if [[ $type == "gui" && ! $(is_gui) ]]; then
      continue
    fi

    for candidate in $candidates; do
      if command_exists "$candidate"; then
        found="$candidate"
        break
      fi
    done

    if [[ -z "$found" ]] && ! is_ignored "$tool"; then
      missing+=("$tool")
    fi
  done

  # Write YAML log
  {
    echo "timestamp: $(date --iso-8601=seconds)"
    echo "missing:"
    for t in "${missing[@]}"; do
      echo "  - $t"
    done
    echo "ignored:"
    for t in "${IGNORED_TOOLS[@]}"; do
      echo "  - $t"
    done
  } > "$TOOLS_LOG"

  # Return missing list for scripts
  MISSING_TOOLS=("${missing[@]}")
}

# ------------------------------------------------------------------------------
# Show reports
# ------------------------------------------------------------------------------
shell_tools_report() { cat "$TOOLS_LOG"; }
shell_tools_missing() { awk '/missing:/ {flag=1; next} /ignored:/ {flag=0} flag && NF {print "- " $0}' "$TOOLS_LOG"; }
shell_tools_ignored() { awk '/ignored:/ {flag=1; next} /^[^ ]/ {flag=0} flag && NF {print "- " $0}' "$TOOLS_LOG"; }

# ------------------------------------------------------------------------------
# Ignore functions
# ------------------------------------------------------------------------------
shell_tools_ignore() {
  for t in "$@"; do
    if ! is_ignored "$t"; then
      echo "$t" >> "$TOOLS_IGNORE"
      IGNORED_TOOLS+=("$t")
    fi
  done
  update_missing_tools_log
}

shell_tools_ignore_all() {
  mapfile -t missing < <(shell_tools_missing)
  shell_tools_ignore "${missing[@]}"
}

# ------------------------------------------------------------------------------
# OS-specific install suggestions
# ------------------------------------------------------------------------------
tool_install_cmd() {
  local tool=$1
  case "$PKG_MANAGER" in
    apt) echo "sudo apt install $tool" ;;
    pacman) echo "sudo pacman -S $tool" ;;
    dnf) echo "sudo dnf install $tool" ;;
    pkg) echo "pkg install $tool" ;;
    brew) echo "brew install $tool" ;;
    manual) echo "# install $tool manually (no package manager detected)" ;;
  esac
}

shell_tools_install() {
  for tool in "$@"; do echo "$(tool_install_cmd $tool)"; done
}

shell_tools_install_all() {
  mapfile -t missing < <(shell_tools_missing)
  shell_tools_install "${missing[@]}"
}

# ------------------------------------------------------------------------------
# Notification helper
# ------------------------------------------------------------------------------
notify_missing() {
  local msg=$1
  # Only use notify-send if GUI
  if is_gui && command_exists notify-send; then
    notify-send "Shell Tools Tracker" "$msg"
  fi
}

# ------------------------------------------------------------------------------
# Help
# ------------------------------------------------------------------------------
shell_tools_help() {
cat <<EOF
Shell Tools Tracker Commands:
  audit            → force full check, update YAML log
  report           → print full YAML log
  missing          → list missing tools
  ignored          → list ignored tools
  ignore <tool>    → ignore a tool permanently
  ignore_all       → ignore all missing tools
  install <tool>   → show OS-specific install command for tool
  install_all      → show install commands for all missing tools
  help             → display this help message
EOF
}

# ------------------------------------------------------------------------------
# Entry point
# ------------------------------------------------------------------------------
run_wrapper() {
  update_missing_tools_log

  local today
  today=$(date +%F)

  # First run: log does not exist
  if [[ ! -f "$TOOLS_LOG" ]]; then
    echo "⚠️ First run audit – full report:"
    shell_tools_report
    notify_missing "First run audit: some tools may be missing"
    return
  fi

  # Daily login notification (once per day)
  if [[ ! -f "$LAST_NOTIFY" || $(cat "$LAST_NOTIFY") != "$today" ]]; then
    touch "$LAST_NOTIFY"
    if [[ ${#MISSING_TOOLS[@]} -gt 0 ]]; then
      notify_missing "They are missing dependencies"
    fi
  fi

  # Minimal terminal message
  if [[ ${#MISSING_TOOLS[@]} -gt 0 ]]; then
    echo "⚠️ They are missing dependencies"
  fi
}

# ------------------------------------------------------------------------------
# Command dispatch
# ------------------------------------------------------------------------------
case "$1" in
  audit) update_missing_tools_log; shell_tools_report ;;
  report) shell_tools_report ;;
  missing) shell_tools_missing ;;
  ignored) shell_tools_ignored ;;
  ignore) shift; shell_tools_ignore "$@" ;;
  ignore_all) shell_tools_ignore_all ;;
  install) shift; shell_tools_install "$@" ;;
  install_all) shell_tools_install_all ;;
  help|"") shell_tools_help ;;
  *) echo "Unknown command '$1'"; shell_tools_help ;;
esac

# ------------------------------------------------------------------------------
# Minimal startup polluter
# Only run automatic notifications if sourced in interactive shell
# ------------------------------------------------------------------------------
if [[ $- == *i* ]]; then
  run_wrapper
fi

