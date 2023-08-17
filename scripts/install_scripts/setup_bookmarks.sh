#: /bin/bash

cd ~/ 
rm -rf .bookmarks
mkdir ~/.bookmarks
cd ~/.bookmarks
ln -s ~/Documents/code/ @code
ln -s ~/Documents/code/git @git
ln -s ~/Documents/code/git/config @config
ln -s ~/Documents/code/git/config/documentations @documentations
ln -s ~/Documents/code/git/config/obsidian/vaults/ @vaults
ln -s ~/Documents/code/git/config/scripts @scripts
ln -s ~/Documents/code/git/config/config_files @home

rm -rf ~/Documents/Obsidian/vaults
mkdir -p ./Documents/Obsidian/vaults
cd ~/Documents/Obsidian 
ln -s Documents/code/git/config/obsidian/vaults/ ./vaults

cd ~/

echo "if test -d '$HOME/.bookmarks'; then" >> .bashrc
echo "  export CDPATH='.:$HOME/.bookmarks:/'" >> .bashrc
echo "fi" >> .bashrc

echo "if test -d '$HOME/.bookmarks'; then" >> .zshrc
echo "  export CDPATH='.:$HOME/.bookmarks:/'" >> .zshrc
echo "fi" >> .zshrc
