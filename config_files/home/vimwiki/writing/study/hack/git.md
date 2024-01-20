# Git

vcs : version control system
Looks at file and track changes, store them in history and compare them with previous history


	```bash
	# create a repository
	$ git init project_name
	
	# check the status of our project
	$ git status
	
	# add files to the staging area
	$ git add my_file
	
	# see the changes since the last commit
	$ git diff
	
	# remove a file from the staging area
	$ git restore --staged my_file
	
	# revert the changes mades in the commit
	$ git revert my_file
	
	# add file to the repository
	$ git commit -m "comment about your commit"
	
	# send your changes to the repository
	$ git push
	
	# get back a file deleted from the working directory
	$ git restore my_file
	
```

Files in a git project can be in three different states

* in the working direcrory : 
	files in this context are not part of the repository yet. You can work on them and modify them but no one else can see what you have done and if you were to delete the project folder they would be lost.
* Staging area :
  files in this context are ready to be added to the repository but are not yet. You would add all the files you want to be part of the same commit one after the other and then commit them together with a comment detailling the change you have made
* in the repository :
	thoses files are now part of the project. anyone can see them, pull them and work on them. Even if you loose your data you can always pull them again when they are in this state.

## How to undo changes 

* get the list of all the commits
```bash
git log --pretty=oneline
```
* show the diffs
```bash
git log --patch
```
* get all the details about one commit
```bash
git show id
```
* roll back the project to a previous commit
```bash
git reset --hard id
```

