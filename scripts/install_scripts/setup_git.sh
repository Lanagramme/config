#! /bin/bash

# installer cle ssh
unzip ./ssh.zip
rm -rf ~/.ssh/id_rsa ~/.ssh/id_rsa.pub
mv id_rsa id_rsa.pub ~/.ssh

# ssh git
ssh git -T git@github.com

# go to git and clone config
mkdir -p ~/Documents/code/git
git clone git@github.com:Lanagramme/config ~/Documents/code/git/
# ================
