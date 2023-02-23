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
	nixpkgs.zsh \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.yarn \
	nixpkgs.htop \
	nixpkgs.ranger \
	nixpkgs.neovim \
	nixpkgs.ripgrep \
	nixpkgs.cmatrix \
	nixpkgs.firefox \
	nixpkgs.neofetch \
	nixpkgs.nettools \
	nixpkgs.direnv

# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# use zsh as the default shell
sudo chsh -s $(which zsh) $USER
