FILE=~/.nix-profile/etc/profile.d/nix.sh
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else
	echo profile not found
	echo installing nix
	sh <(curl -L https://nixos.org/nix/install) --no-daemon
fi

#source nix
. ~/.nix-profile/etc/profile.d/nix.sh

#install packages
nix-env -iA \
	nixpkgs.git \
	nixpkgs.bat \
	nixpkgs.fzf \
  nixpkgs.feh \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.yarn \
	nixpkgs.htop \
  nixpkgs.picom \
  nixpkgs.tilix \
	nixpkgs.ranger \
	nixpkgs.neovim \
	nixpkgs.direnv \
  nixpkgs.polybar \
	nixpkgs.ripgrep \
	nixpkgs.cmatrix \
	nixpkgs.firefox \
	nixpkgs.awesome \
	nixpkgs.neofetch \
	nixpkgs.nettools \
	nixpkgs.libsForQt5.gwenview \
  nixpkgs.networkmanagerapplet

# add zsh to valid login shells
#command -v zsh | sudo tee -a /etc/shells

# use zsh as the default shell
#sudo chsh -s $(which zsh) $USER
