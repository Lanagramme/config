# ==============================================================================
# Azarath Metrion Zinthos
# ==============================================================================

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
# Powerlevel10k instant prompt (must stay at the very top)
[[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] && \
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"


# ------------------------------------------------------------------------------
# Load generic profile first (if exists)
# ------------------------------------------------------------------------------
[[ -f "$HOME/.profile" ]] && source "$HOME/.profile"

# ------------------------------------------------------------------------------
# Paths
# ------------------------------------------------------------------------------
export PATH="/usr/local/bin:$HOME/.local/bin:$HOME/script:$PATH"

# ------------------------------------------------------------------------------
# History (zsh-native, replaces bash vars)
# ------------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

# ------------------------------------------------------------------------------
# Oh My Zsh
# ------------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 13

# Oh My Zsh plugins
# - - - - - - - - - - - - - - - - - - -  -
plugins=( git zsh-autosuggestions )

# Safe plugin loading: warn about missing and suggest install
for plugin in "${plugins[@]}"; do
  if [[ ! -f "$ZSH/plugins/$plugin/$plugin.plugin.zsh" ]]; then
    echo "⚠️ Missing plugin: $plugin"
    echo "Install it with: git clone https://github.com/zsh-users/$plugin.git $ZSH/custom/plugins/$plugin"
  fi
done

source "$ZSH/oh-my-zsh.sh" # Do not move from here

# autosuggestions key-bindings
# - - - - - - - - - - - - - - - - - - -  -
bindkey '^W' forward-word
bindkey '^E' forward-char
#
# Powerlevel10k config
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ------------------------------------------------------------------------------
# Zsh options / UX
# ------------------------------------------------------------------------------
DISABLE_MAGIC_FUNCTIONS="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Completion UX (interactive menu)
# - - - - - - - - - - - - - - - - - - -  -
zmodload zsh/complist
zstyle ':completion:*' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# ------------------------------------------------------------------------------
# wal (fire-and-forget, job-safe)
# ------------------------------------------------------------------------------
[[ -f ~/.cache/wal/sequences ]] && cat ~/.cache/wal/sequences &!

# ------------------------------------------------------------------------------
# zoxide
# ------------------------------------------------------------------------------
eval "$(zoxide init --cmd cd zsh)"

# ------------------------------------------------------------------------------
# Aliases & functions (bash-safe file)
# ------------------------------------------------------------------------------
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

# ------------------------------------------------------------------------------
# Shell Tools Tracker integration
# Only minimal pollution on interactive shells
# ------------------------------------------------------------------------------
if [[ -x "$HOME/scripts/shell_tools_tracker.sh" && $- == *i* ]]; then
  source "$HOME/scripts/shell_tools_tracker.sh"
fi
