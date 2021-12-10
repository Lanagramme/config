#!/bin/bash

sudo apt update && sudo apt upgrade
sudo apt install awesome rofi feh

 
if [ -d "~/.config/awesome/" ]; then
	mkdir ~/.config/awesome/backup/
	mv ~/.config/awesome/* -r ~/.config/awesome/backup/
fi 
  
mv ./config_files/awesome/* -r ~/.config/awesome 
