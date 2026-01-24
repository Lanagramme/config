# ------------------------------------------------------------------------------
# Azarath Metrion Zinthos - A ZSH Configuration
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Powerlevel10k instant prompt (must be at the top)
# ------------------------------------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ------------------------------------------------------------------------------
# Load profile
# ------------------------------------------------------------------------------
[[ -f "$HOME/.profile" ]] && source "$HOME/.profile"

# ------------------------------------------------------------------------------
# Paths 
# ------------------------------------------------------------------------------
# This is you $PATH variable, append new entries by adding a new line
typeset -U path PATH
path=(
  /usr/local/bin
  $HOME/.local/bin
  $HOME/script
  $path
)

# ------------------------------------------------------------------------------
# History
# ------------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt \
  HIST_IGNORE_ALL_DUPS \
  HIST_IGNORE_SPACE \
  HIST_REDUCE_BLANKS \
  SHARE_HISTORY \
  EXTENDED_HISTORY \
  INC_APPEND_HISTORY

# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

# ------------------------------------------------------------------------------
# Tools
# ------------------------------------------------------------------------------

# wal
[[ -r ~/.cache/wal/sequences ]] && cat ~/.cache/wal/sequences &!

# zoxide
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh --cmd cd)"
fi

# Shell Tools Tracker
if [[ -x "$HOME/scripts/shell_tools_tracker.sh" && $- == *i* ]]; then
  source "$HOME/scripts/shell_tools_tracker.sh"
fi

# ------------------------------------------------------------------------------
# Completion settings
# ------------------------------------------------------------------------------
zmodload zsh/complist

mkdir -p ~/.zsh/cache
autoload -Uz compinit
compinit -d ~/.zsh/cache/zcompdump

zstyle ':completion:*' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# ------------------------------------------------------------------------------
# Keybindings
# ------------------------------------------------------------------------------
bindkey '^E' forward-char
bindkey '^W' forward-word
bindkey '^A' beginning-of-line
bindkey '^K' kill-line
bindkey '^R' history-incremental-search-backward

# ------------------------------------------------------------------------------
# Oh My Zsh
# ------------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Updates
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 13


# Oh My Zsh options
DISABLE_MAGIC_FUNCTIONS="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)


# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# ------------------------------------------------------------------------------
# Powerlevel10k
# ------------------------------------------------------------------------------
[[ -o interactive && -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

