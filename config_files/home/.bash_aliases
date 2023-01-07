# ====== Aliasses ======
# For a full list of active aliases, run `alias`.
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# console commands
alias cl="clear"
alias Xreset="xrdb ~/.Xresources"

# run sh files
alias sign_git="~/Documents/code/git/config/shfiles/git_connect.sh"

# run programs
alias v="nvim"
alias web="chromium-browser"

# open config files
alias aw="v ~/.config/awesome/rc.lua"
alias vimrc="nvim -p ~/.config/nvim/general/general.vim ~/.config/nvim/keybindings/keybindings.vim ~/.config/nvim/pluggins"
alias zshrc="v ~/.zshrc"
alias bashrc="v ~/.bashrc"
alias bashalias="v ~/.bash_aliases"
alias ohmyrc="v ~/.oh-my-zsh"
alias xrc="v ~/.Xresources"

alias p="sudo pacman -S"
alias mkd="mkdir -pv" #create directory --create parent --give visual feedback
alias ref="source ~/.bashrc" #reload bashrc
alias l="ls -la --color=auto"

#ssh

alias noumenm="ssh ludji@noumenm.org"
alias gozaimass="ssh ludji@gozaimass.io"
alias ionos="ssh lux@82.165.206.77"


# Bookmarks

if [ -d "$HOME/.bookmarks" ]; then
    export CDPATH=".:$HOME/.bookmarks:/"
fi

alias goto="cd -P"
