# For a full list of active aliases, run `alias`.
# ====== Aliasses ======
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# ===== run programs =====
alias v="nvim"
alias vimwiki='v -c VimwikiIndex'
alias wiki='v -c VimwikiIndex'
alias fzf="fzf --preview='less {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"

# ===== config files =====
# alias aw="v ~/.config/awesome/rc.lua"
# alias vimrc="nvim -p ~/.config/nvim/general/general.vim ~/.config/nvim/keybindings/keybindings.vim ~/.config/nvim/pluggins"
# alias zshrc="v ~/.zshrc"
# alias bashrc="v ~/.bashrc"
# alias bashalias="v ~/.bash_aliases"
# alias ohmyrc="v ~/.oh-my-zsh"
# alias xrc="v ~/.Xresources"

alias p="sudo pacman -S"
alias cl="clear"
alias mkd="mkdir -pv" #create directory --create parent --give visual feedback
alias ref="source ~/.bashrc" #reload bashrc

#
if command -v exa &> /dev/null
then
  alias l="exa -la --header --icons"
  alias ls='exa'
  # Check if eza is installed
elif command -v eza &> /dev/null
then
  alias l="eza -la --header --icons"
  alias ls='eza'
  # Default to ls -la if neither exa nor eza is installed
else
  alias l='ls -la --color=auto'
  alias ls='ls --color=auto'
  fi
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'

# ===== ssh =====
# alias noumenm="ssh ludji@noumenm.org"
# alias gozaimass="ssh ludji@gozaimass.io"
# alias ionos="ssh lux@82.165.206.77"
# alias sdu1="ssh ludji@sdu1.gozaimass.io"
# alias sdu2="ssh ludji@sdu2.gozaimass.io"
# alias sdu3="ssh ludji@sdu3.gozaimass.io"

# ===== Bookmarks =====
alias goto="cd -P"

if [ -d "$HOME/.bookmarks" ]; then
  export CDPATH=".:$HOME/.bookmarks:/"
fi

# ===== Love2D =====
alias love="~/.config/love/love-11.5-x86_64.AppImage"
# alias npm="pnpm"
alias musicplayer="ncmpcpp"
