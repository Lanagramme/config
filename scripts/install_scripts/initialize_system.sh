#! /bin/sh

if [[ $1 != "deb" ]] && [[ $1 != "arch" ]]; then
	echo "options are 'deb' and 'arch'"
	exit 0
fi

sh ./install_nix.sh
sh ./setup_git
sh ./install_zsh.sh $1
sh ./setup_neovim.sh
sh ./setup_awesome.sh

#initialize dotfiles
sh ./initialize_dotfiles.sh
sh ./setup_bookmarks.sh

