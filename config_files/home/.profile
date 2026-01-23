# ~/.profile
# Portable login environment (X11 + Wayland)
export PROFILE_LOADED=1

##########
# Locale #
##########
export LANG=fr_FR.UTF-8
export LC_ALL=fr_FR.UTF-8

####################
# Preferred tools  #
####################

# Browser preference order
export BROWSER=zen-browser
export BROWSER_FALLBACKS="firefox firefox-esr chromium"

# File managers
export FILE_MANAGER=pcmanfm
export FILE_MANAGER_FALLBACKS="nautilus dolphin"
export CLI_FILE_MANAGER=yazi

# Editors
export EDITOR=nvim
export VISUAL=nvim
export EDITOR_FALLBACKS="vim vi"

# Terminal emulators
export TERMINAL=kitty
export TERMINAL_FALLBACKS="alacritty gnome-terminal xterm"

# Shell preference (informational)
export PREFERRED_SHELL=zsh
export SHELL_FALLBACKS="bash sh"

####################
# Session metadata #
####################

# These are hints, not enforcement
export SESSION_LANGUAGE=fr
export SESSION_KEYBOARD=fr

