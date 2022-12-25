
# Installer Zsh
Sur les distribution de type debian, _zsh_ est disponible dans _apt_

```console
	sudo apt install zsh
	
	// vérifiez l'installation de zsh
	zsh --version
```

Définir zsh comme shell par défault

```console
	sudo chsh -s $(which zsh)
```

Alternatively

```console
 chsh
 	/bin/zsh
```

Check the current shell with
```console
	echo $0
```

Zsh est maintenant le shell par défaut de l'utilisateur connecté. Au prochain
démmarage du terminal, un prompt concernant la création d'un fichier de 
s'affichera. Choisir l'option 2.

# Installer Oh-my-zsh

L'installation de zsh necessite l'usage de _git_ et _curl_.

```console
	sudo apt install git curl
```

une fois _git_ et _curl_ installé


```console
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

Si l’installation se passe bien, le logo Oh My Zsh apparaît, ainsi qu’une 
petite flèche en bas à gauche.

# Utiliser un theme par default

Oh-my-zsh est installé avec un liste de themes par défault.


```console
	ch  ~/.oh-my-zsh/themes
	ls
```

Les noms des fichiers sont composés comme suit:<nom>.zsh-theme.
Pour appliquer un theme, changer la valeur de la variable ZSH_Theme du fichier 
~/.zshrc et la remplacer par le nom du theme.

Pour charger un theme aléatoire à chaque démarage de terminal, remplacer la
valeur de la variable par "random".

# Install powerlevel10k






