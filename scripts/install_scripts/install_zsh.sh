#! /bin/bash

if [[ $1 != "deb" ]] && [[ $1 != "arch" ]]; then
	echo "options are 'deb' and 'arch'"
	exit 0
fi

echo "|.========================================.|"
echo ""
echo "Creating bookmarks"
echo ""

# install zsh
if [[ $1 == "deb" ]]; then
	sudo apt-get install zsh -y
elif [[ $2 == "arch" ]]; then 
	sudo pacman -S zsh
fi

# install ohmyzsh
sh install_omz.sh

# install zsh pluggins
sh ./install_zsh_plugins.sh

# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# use zsh as the default shell
sudo chsh -s $(which zsh) $USER

echo ""
echo "You may need to initialize the dotfiles."
echo ""
echo "|.========================================.|"
# ================

