#! /bin/bash

if [[ $1 == "chad" ]] || [[ $1 == "old" ]]; then
  if test -d ~/.config/nvim-old || test -d ~/.config/nvim-chad/; then 
	  echo "Pret à procéder"
  else
	  echo "Il manque un des directory"
    exit 0
  fi

  if test -d ~/.config/nvim-${1}/ ; then
    if test $1 == "chad"; then
      name="old"
    else
      name="chad"
    fi

    mv ~/.config/nvim/ ~/.config/nvim-${name}/
    mv ~/.config/nvim-${1}/ ~/.config/nvim/
  else
	  echo  "~/.config/nvim-${1}/"
    echo "Rien à faire"
  fi
else 
  echo 'Les valeurs possibles sont "chad" et "old"'
fi
