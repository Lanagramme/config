#! /bin/sh

echo "|.========================================.|"
echo ""
echo "Setup Awesome"
echo ""

if [[ -f ~/.nix-profile/etc/profile.d/nix.sh ]]; then
	nix-env -iA \
		nixpkgs.feh \
		nixpkgs.networkmanagerapplet \
		nixpkgs.picom \
		nixpkgs.polybar \
		nixpkgs.rofi \
		nixpkgs.tilix \
fi

echo ""
echo "You may need to initialize the dotfiles."
echo ""
echo "|.========================================.|"
# ================
