#! /bin/bash

if [[ $1 != "deb" ]] && [[ $1 != "arch" ]]; then
	echo "options are 'deb' and 'arch'"
	exit 0
fi

bash ./install_nix.sh
bash ./setup_git.sh
bash ./install_zsh.sh $1
bash ./setup_neovim.sh
bash ./setup_awesome.sh

#initialize dotfiles
bash ./initialize_dotfiles.sh
bash ./setup_bookmarks.sh

