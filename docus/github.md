# Documentation du CLI github

***Cloner un repository***
```
>git clone https://github.com/<user>/<repository>
```

***Vérifier le status***
Le status contiens les informations sur la branche en cours
  - l'état de la branche locle par rapport à la version en ligne
  - les commits en attente
  - ...

```
>git status
```

***Préparer un commit***
Le commit envoie les modifications
```
// ajouter tous les changement locaux
>git commit *

// ajouter les changement pour un seul fichier
>git commit <file>

// commit avec un message
>git commit * -m "*message*"
```

***Push***
```
>git push
```
