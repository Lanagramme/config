#! /bin/sh

echo "|.========================================.|"
echo ""
echo "Setup Neovim"
echo ""

FILE=~/.nix-profile/etc/profile.d/nix.sh
if [ !-f "$FILE" ]; then
	echo "Neovim ne peut pas être installé :"
	echo "nix is not installed"
	exit 0
fi

#install neovim
nix-env -iA \
	nixpkgs.neovim \

# setup nvchad
rm -rf ~/.local/share/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

# setup vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo ""
echo "You may need to initialize the dotfiles."
echo ""
echo "|.========================================.|"
# ================

