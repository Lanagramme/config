#! /bin/bash

#home
cd ~/
# delete all
rm -fr .bash_aliases .bashrc .fonts .gitconfig .profile .tmux.conf .zshrc vimwiki .bookmarks .paths

# create bookmarks
mkdir ~/.bookmarks
cd ~/.bookmarks
ln -s ~/Documents/code/ @code
ln -s @code/git @git
ln -s @git/config @config
ln -s @config/documentations @documentations
ln -s @config/scripts @scripts
ln -s @config/config_files @home

source .bash_aliases

# link dotfiles
ln -s @home/home/.bash_aliases ~/
ln -s @home/home/.bashrc ~/
ln -s @home/home/.paths ~/
ln -s @home/home/.fonts ~/
ln -s @home/home/.gitconfig ~/
ln -s @home/home/.profile ~/
ln -s @home/home/.tmux.conf ~/
ln -s @home/home/.zshrc ~/

# link vimwiki
ln -s @home/home/vimwiki ~/

#config
cd ~/.config
rm -f awesome nvim polybar

ln -s @home/home/.config/awesome ~/.config
ln -s @home/home/.config/nvim    ~/.config
ln -s @home/home/.config/polybar ~/.config


