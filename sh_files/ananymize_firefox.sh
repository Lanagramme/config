#!/bin/bash

# /home/$USER/.mozilla/firefox/4p8ayrlv.default-release

mkdir better-firefox

url=$(curl -s https://api.github.com/repos/arkenfox/user.js/releases/latest \
| grep zipball_url \
| cut -d : -f 2,3 \
| cut -d , -f 1 \
| tr -d \" )

wget -O better-firefox.zip $url

unzip ./better-firefox.zip -d ./better-firefox

echo 'cone'

files=""
index=0

for i in `find ./better-firefox -name '*.sh'` ; do
	files[$index]="$i "
	index=$index+1
done

echo ${files[1]}