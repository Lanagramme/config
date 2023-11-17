#! /bin/bash

#home
cd ~/
# delete all
rm -fr .bash_aliases .bashrc .fonts .gitconfig .profile .tmux.conf .zshrc vimwiki .paths

# link dotfiles
ln -s ~/Documents/code/git/config/config_files/home/.bash_aliases ~/
ln -s ~/Documents/code/git/config/config_files/home/.bashrc ~/
ln -s ~/Documents/code/git/config/config_files/home/.paths ~/
ln -s ~/Documents/code/git/config/config_files/home/.fonts ~/
ln -s ~/Documents/code/git/config/config_files/home/.gitconfig ~/
ln -s ~/Documents/code/git/config/config_files/home/.profile ~/
ln -s ~/Documents/code/git/config/config_files/home/.tmux.conf ~/
ln -s ~/Documents/code/git/config/config_files/home/.zshrc ~/

# link vimwiki
ln -s ~/Documents/code/git/config/config_files/home/vimwiki ~/

#config
cd ~/.config
rm -rf awesome nvim polybar

ln -s ~/Documents/code/git/config/config_files/home/.config/awesome  ~/.config
ln -s ~/Documents/code/git/config/config_files/home/.config/nvim-old ~/.config
ln -s ~/Documents/code/git/config/config_files/home/.config/polybar  ~/.config


