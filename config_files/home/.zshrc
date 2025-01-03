export LANG=fr_FR.UTF-8
export LANGUAGE=fr_FR:fr
export LC_ALL=fr_FR.UTF-8

# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/ludji/.zsh/completions:"* ]]; then export FPATH="/home/ludji/.zsh/completions:$FPATH"; fi
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/share/applications/:$PATH
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
export PATH=~/.local/bin/:$PATH
export LD_LIBRARY_PATH=/usr/local/lib/:/usr/lib/
export ZSH="$HOME/.oh-my-zsh"
export LANG=fr_FR.UTF-8

# Path to your oh-my-zsh installation.

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# History time stamp
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
  export SUDO_EDITOR='nvim'
else
  export EDITOR='nvim'
  export SUDO_EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

if [ -d "$HOME/.bookmarks" ]; then
    export CDPATH=".:$HOME/.bookmarks:/"
fi

export VISUAL="nvim"

# ====== Aliases ======
source ~/.bash_aliases
source ~/.paths

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
if test -d '/home/ludji/.bookmarks'; then
  export CDPATH='.:/home/ludji/.bookmarks:/'
fi

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
[[ -f ~/.cache/wal/sequences ]] && (cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
[[ -f ~/.cache/wal/sequences ]] && cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
[[ -f ~/.cache/wal/colors-tty.sh ]] && source ~/.cache/wal/colors-tty.sh
if test -d '/home/ludji/.bookmarks'; then
  export CDPATH='.:/home/ludji/.bookmarks:/'
fi
if test -d '/home/ludji/.bookmarks'; then
  export CDPATH='.:/home/ludji/.bookmarks:/'
fi

# pnpm
export PNPM_HOME="/home/ludji/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# =======
# function ya() {
#	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
#	yazi "$@" --cwd-file="$tmp"
#	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
#		cd -- "$cwd"
#	fi
#	rm -f -- "$tmp"
#}
eval "$(zoxide init --cmd cd zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(fzf --zsh)"

npm config set prefix '~/.local/'
source /usr/share/nvm/init-nvm.sh
command -v setxkbmap >/dev/null 2>&1 && setxkbmap -layout fr

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
