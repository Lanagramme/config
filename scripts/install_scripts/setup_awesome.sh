#! /bin/bash

echo "|.========================================.|"
echo ""
echo "Setup Awesome"
echo ""

. ~/.nix-profile/etc/profile.d/nix.sh
nix-env -iA \
	nixpkgs.awesome \
	nixpkgs.feh \
	nixpkgs.networkmanagerapplet \
	nixpkgs.picom \
	nixpkgs.polybar \
	nixpkgs.rofi \
	nixpkgs.tilix \
		
echo ""
echo "You may need to initialize the dotfiles."
echo ""
echo "|.========================================.|"
# ================

