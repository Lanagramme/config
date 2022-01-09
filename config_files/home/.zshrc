# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Keep this line under the ZSH_THEME declaration
source $ZSH/oh-my-zsh.sh
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# History time stamp
HIST_STAMPS="mm/dd/yyyy"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

export LANG=fr_FR.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ====== Updates ======
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  	# just remind me to update when it's time
zstyle ':omz:update' frequency 1 			# look for updates every 1 days

# ====== Aliasses ======
# For a full list of active aliases, run `alias`.

# Reload configurations
alias sz="source ~/.zshrc"
alias sb="source ~/.bashrc"

# console commands
alias cl="clear"
alias Xreset="xrdb ~/.Xresources"

# run sh files
alias wifi="~/connect_wifi_GalaxyTabS2.sh"
alias sign_git="~/Documents/code/git/config/shfiles/git_connect.sh"

# run programs
alias v="nvim"
alias web="chromium-browser"

# open config files
alias aw="v ~/.config/awesome/rc.lua"
alias vimrc="v -S ~/.config/nvim/neovim-config.vim"
alias zshrc="v ~/.zshrc"
alias bashrc="v ~/.bashrc"
alias ohmyrc="v ~/.oh-my-zsh"
alias xrc="v ~/.Xresources"

# Suffixes aliasses
alias -s md=mdless
alias -s {js,ts,html,css,sass,scss,php}=nvim

# Os dependant alias
# if [[ $OSTYPE == linux* ]]; then
# fi

# Source config gile
# for f in ~/.config/shellconfig/*; do source "$f";done
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -d "$HOME/.bookmarks" ]; then
    export CDPATH=".:$HOME/.bookmarks:/"
    alias goto="cd -P"
fi

export VISUAL="nvim"
export PATH=$PATH':/path/to/add'
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
