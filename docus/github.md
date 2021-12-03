# Documentation du CLI github

## set up git ssh connexion

**If the pc does not have a ssh key**

```
ssh-keygen -C lborromee16@gmail.com
```

accept everthing.

```
cd ~/.ssh
cat id_rsa.pub
```

copy the output.
go to github and connect.
go to your settings >> ssh and gpg  >> new ssh key
paste the output

```
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa

git-config --global.name "github_username"
git-config --global.email "github_email"

```

## connect to github with ssh
```
ssh -T git@github.com
```


## Cloner un repository without ssh
```
git clone https://github.com/<user>/<repository>
```

## cloner un repository with ssh

```
git clone git@github.com:<user>/<repository>
```

***Vérifier le status***
Le status contiens les informations sur la branche en cours
  - l'état de la branche locle par rapport à la version en ligne
  - les commits en attente
  - ...

```
git status
```

## Préparer un commit
Le commit envoie les modifications
```
// ajouter tous les changement locaux
git add *

// ajouter les changement pour un seul fichier
git commit <file>

// commit avec un message
git commit * -m "*message*"
```

## Push
```
git push
```
