#!/bin/sh

curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R

curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh

export SPICETIFY_INSTALL="/home/ludji/spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"

spicetify
spicetify backup apply enable-devtool

cd ~
git clone https://github.com/morpheusthewhite/spicetify-themes.git
cd spicetify-themes
cp -r * ~/.config/spicetify/Themes

spicetify config current_theme Dribbblish
spicetify config color_scheme Base
spicetify apply
