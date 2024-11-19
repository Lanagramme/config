#! /bin/bash

echo "|.========================================.|"
echo ""
echo "Creating bookmarks"
echo ""

# create bookmarks
[[ -d ~/.bookmarks ]] && rm -rf ~/.bookmarks
mkdir ~/.bookmarks
cd ~/.bookmarks
ln -s ~/Documents/code/ @code
ln -s @code/git @git
ln -s @git/config @config
ln -s @config/documentations @documentations
ln -s @config/scripts @scripts
ln -s @config/config_files @home

echo ""
echo "|.========================================.|"
