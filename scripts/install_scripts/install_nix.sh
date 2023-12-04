#! /bin/bash

echo "|.========================================.|"
echo ""
echo "Installing Nix"
echo ""

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
	nixpkgs.bat \
	nixpkgs.zip \
	nixpkgs.unzip \
	nixpkgs.btop \
	nixpkgs.pywal \
	nixpkgs.cargo \
	nixpkgs.cmatrix \
	nixpkgs.cmake \
	nixpkgs.direnv \
	nixpkgs.fzf \
	nixpkgs.gcc \
	nixpkgs.libsForQt5.gwenview \
	nixpkgs.nettools \
	nixpkgs.neofetch \
  nixpkgs.python3Full \
	nixpkgs.ranger \
	nixpkgs.ripgrep \
	nixpkgs.stow \
	nixpkgs.tmux \
	nixpkgs.yarn \

echo ""
echo "|.========================================.|"
# ================

