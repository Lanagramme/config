popd => return to previous directory
locate [filename] => find filename in the locate database
sudo updatedb => update the locate database
whatis [command] => explain the command
cal => print a calendar
apropos [subject] => list commands relative do the subject
man [command] => detailled description of command
touch [file] => update date on file and force backup if enabled
rmdir only delete empty directories
cat [file] => print file content
cat >> [file] => append into file 
cat > [file] => replace file content
cat [file1] [file2] => concatenate file1 and file2
more [file] => page through file
	q => quit
less [file] => scroll, search through file
history => print the last 1000 unique commands typed
[command1] | [command2] => redirect the output of command1 as input to command2
sudo -s => act as root
	exit => exit root
$ => standard user
# => root user
su - [user] => login as user and go to their home
su [user] => login as user
su => connect as root user [do not !]
su - => connect as root user and go to their home directory
users => list connected users
id => print infos about the connected user
lscpu => better neofetch

!! => redo last command
!!:s/status/start => redo the las command but substitute status for start

