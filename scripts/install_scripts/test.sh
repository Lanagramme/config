
list=("git" "bat" "fzf" "zsh" "tmux" "stow" "yarn" "htop" "ranger" "neovim" "ripgrep" "cmatrix" "firefox" "neofetch" "nettools" "direnv")
for item in ${list[@]}; do

    nix-env -q | grep item 
 #    if [ -z $(nix-env -q | grep item) ]; then
	# echo 'new' $item 
	# # nix-env -iA nixpkgs.$item
 #    else echo 'exist' $item
 #    fi
	#
done

