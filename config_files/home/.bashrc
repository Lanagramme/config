#
# ~/.bashrc
#

shopt -S autocd #Allows you to cd into directory merly by typing the directory name.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# make default editor Neovim
export EDITOR=nvim

# use custom fd command for fzf incl. showing hidden files by default
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# configure silver command prompt
export SILVER_ICONS=nerd
source <(silver init)

source ~/.bash_aliases

if [ -d "$HOME/.bookmarks" ]; then
    export CDPATH=".:$HOME/.bookmarks:/"
    alias goto="cd -P"
fi

export VISUAL="nvim"
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

# ====== Aliases ======
alias p="sudo pacman"
alias mkd="mkdir -pv" #create directory --create parent --give visual feedback
alias ref="source ~/.bashrc" #reload bashrc
alias l="ls -la --color=auto"

