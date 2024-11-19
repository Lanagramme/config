#! /bin/bash

if test -d ~/.config/nvim-chad/;then
  mv ~/.config/nvim ~/.config/nvim-old
  mv ~/.config/nvim-chad ~/.config/nvim
else
  mv ~/.config/nvim ~/.config/nvim-chad
  mv ~/.config/nvim-old ~/.config/nvim
fi

