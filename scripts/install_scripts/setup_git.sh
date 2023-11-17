#! /bin/sh

# installer cle ssh
mkdir .ssh
unzip ./zzb.zip ./.ssh
mv id_rsa id_rsa.pub known_host ./.ssh 
rm -rf ~/.ssh
mv ./.ssh ~/
rm -f .ssh

# ssh git
ssh git -T git@github.com

# go to git and clone config
mkdir -p ~/Documents/code/git
git clone git@github.com:Lanagramme/config ~/Documents/code/git/
# ================
