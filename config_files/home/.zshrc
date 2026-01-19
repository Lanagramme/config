# Azarat Metrium Zintos
# ====================

# ------------------------------------------------------------------------------
# Powerlevel10k instant prompt (must stay at the very top)
# ------------------------------------------------------------------------------
[[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] && \
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

# ------------------------------------------------------------------------------
# Locale (avoid LC_ALL unless debugging)
# ------------------------------------------------------------------------------
export LANG=fr_FR.UTF-8
export LC_CTYPE=fr_FR.UTF-8
export LANGUAGE=fr_FR:fr

# ------------------------------------------------------------------------------
# Paths
# ------------------------------------------------------------------------------
export PATH="/usr/local/bin:$HOME/.local/bin:$HOME/script:$PATH"

# ------------------------------------------------------------------------------
# Editor
# ------------------------------------------------------------------------------
export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"

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

plugins=( git zsh-autosuggestions)

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

