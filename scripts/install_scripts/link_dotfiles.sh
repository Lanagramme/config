#! /bin/bash

#home
cd ~/
# delete all
rm -fr .bash_aliases .bashrc .fonts .gitconfig .paths .profile vimwiki wikis .zshrc

# link dotfiles
home_files=(
  ".bash_aliases"
  ".bashrc"
  ".fonts"
  ".gitconfig"
  ".paths"
  ".profile"
  "vimwiki"
  "wikis"
  ".zshrc"
)

cd ~/Documents/code/git/config/config_files/home/
for file in "${home_files[@]}"; do 
  ln -s $(realpath "$file") ~/
done

#config
if [ ! -d ~/.config ]; then
  mkdir ~/.config
else
  echo ""
fi
  
cd ~/.config
rm -rf alacritty awesome nvim polybar picom rofi tmux bspwm sxhkd

config_files=(
  "awesome"
  "nvim/"
  "polybar/"
  "picom/"
  "rofi/"
  "tmux/"
  "bspwm"
  "sxhkd"
)

cd ~/Documents/code/git/config/config_files/home/.config/
for file in "${config_files[@]}"; do 
  ln -s $(realpath "$file") ~/.config
done
