#! /bin/sh

if [[ $1 != "deb" ]] || [[ $1 != "arch" ]]; then
	echo "options are 'deb' and 'arch'"
	exit 0
fi

# setup git
#     installer cle ssh
cp ./zzb.zip ~#/
cd ~/
unzip ~/zzb.zip
rm -f zzb.zip

#     ssh git
ssh git -T git@github.com

#     mkdir git
mkdir -p ~/Documents/code/git

#     go to git and clone config
cd ~/Documents/code/git
git clone git@github.com:Lanagramme/config
# ================

#install zsh
if [[ $1 == "deb" ]]; then
	sudo apt-get install zsh -y
elif [[ $2 == "arch" ]]; then
	sudo pacman -S zsh
fi

#     install ohmyzsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh

#     install zsh pluggins
cd ~/Documents/code/git/config/scripts/install_scripts/
sh install_dependencies.sh
# ================

# install nix /
sh install_nix.sh

if [[ $1 == "deb" ]]; then
	sudo apt install $(cat ./awesome_requirements)
	sudo apt install $(cat ./coding_environment_deb)
elif [[ $2 == "arch" ]]; then
	sudo pacman -S $(cat ./awesome_requirements)
	sudo apt install $(cat ./coding_environment_arch)
fi

#setup neovim
#   setup nvchad
rm -rf ~/.local/share/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim-chad --depth 1

#   setup vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#initialize dotfiles
sh initialize_dotfiles.sh
sh setup_bookmarks.sh

#setup awesome
