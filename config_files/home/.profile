# Profile file. Runs on launch
# if no .bash_profile exists

export EDITOR="nvim"
export TERMINAL="gnome-terminal"
export TRUEBROWSER="firefox"


#if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	[[ -f ~/.bashrc ]] && . ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
[[ -d "$HOME/bin" ]] && $PATH="HOME/bin:$PATH"

# set PATH so it includes user's private bin if it exists
[[ -d "$HOME/.local/bin" ]] && $PATH="$HOME/.local/bin:$PATH" 

if [ -e /home/ludji/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ludji/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
. "$HOME/.cargo/env"
. "/home/ludji/.deno/env"