#! /bin/bash

#home
cd ~/
rm -fr .bash_aliases .bashrc .fonts .gitconfig .profile .tmux.conf .zshrc vimwiki .bookmarks .paths

ln -s ~/Documents/code/git/config/config_files/home/.bash_aliases ~/
ln -s ~/Documents/code/git/config/config_files/home/.bashrc ~/
ln -s ~/Documents/code/git/config/config_files/home/.paths ~/
ln -s ~/Documents/code/git/config/config_files/home/.fonts ~/
ln -s ~/Documents/code/git/config/config_files/home/.gitconfig ~/
ln -s ~/Documents/code/git/config/config_files/home/.profile ~/
ln -s ~/Documents/code/git/config/config_files/home/.tmux.conf ~/
ln -s ~/Documents/code/git/config/config_files/home/.zshrc ~/

ln -s ~/Documents/code/git/config/config_files/home/vimwiki ~/
ln -s ~/Documents/code/git/config/config_files/home/.bookmarks ~/

#bookmarks
cd ~/.bookmarks
rm -f @code
ln -s ~/Documents/code/ @code

#config
cd ~/.config
rm -f awesome nvim polybar

ln -s ~/Documents/code/git/config/config_files/home/.config/awesome ~/.config
ln -s ~/Documents/code/git/config/config_files/home/.config/nvim    ~/.config
ln -s ~/Documents/code/git/config/config_files/home/.config/polybar ~/.config


