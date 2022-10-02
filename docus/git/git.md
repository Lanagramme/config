[Table des matière](../table_of_content.md)
# Documentation du CLI github

**Index**
	-	[Basics](#Basics)
	-	[Branches](#Branches)
	-	[Remote](#Remote)
	-	[Conflicts](#Conflicts)
	- [Github](#Github)
	- [Set up git ssh connexion](# Set up git ssh connexion)

[retour](#Documentation du CLI github)
## Basics
**Create a new git project**
```bash
git init
```

**Stage changes**
```bash
git add filenames
-- or
git add *
```

**Create a commit a commit vith a message**
```bash
git commit -m "message"
```

**Push commit**
```bash
git push
```

**Check the branch status**
Le status contiens les informations sur la branche en cours
  - l'état de la branche locle par rapport à la version distante
  - les commits en attente
	- les modifications non ajoutées 
  - ...
```bash
git status
```

[retour](#Documentation du CLI github)
## Branches

Les branches permettent de tester et de versionner du code avant de l'ajouter au projet.
Une branche est crée à partir d'une version du projet et lui est parallèle. 
Elle ne recevra pas les modifications ajoutées à la branche principale, et ses modification n'affecteront pas celle ci tant que les deux ne sont pas fusionnées.

**Créer une branche**

```bash
git checkout -b new_branch_name
git push --set-upstream origin/new_branch_name
```

**Changer de branche**
```bash
git checkout branch_name
-- go to the main branch
git checkout main
```

**Fusionner une branche avec la branche principale**

```bash
git merge branch_name
```

**Ajouter une branche à un serveur distant**
```bash
git push branch_name origin
```
[retour](#Documentation du CLI github)
## Remote
**Envoyer un projet git sur un serveur remote.**
Une fois le projet vide créé sur le serveur.
```bash
git remote add origin git@github.com:<user>/<repo>.git
```
Premier commit.
```bash
git push -u origin master
```

[retour](#Documentation du CLI github)
## Conflicts
Si un conflit est détecté, ouvir le fichier en question et supprimer les parties non désirées puis puis add le fichier et commit.

[retour](#Documentation du CLI github)
# Github

# Set up git ssh connexion

**Create the ssh key**
```
ssh-keygen -C mail_adress
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

git config --global user.name "github_username"
git config --global user.email github_email

```

**Connect to github with ssh**
```
ssh -T git@github.com
```

**Cloner un repository without ssh**
```
git clone https://github.com/<user>/<repository>
```

**Cloner un repository depuis github avec ssh**
```
git clone git@github.com:<user>/<repository>
```

```bash
```
