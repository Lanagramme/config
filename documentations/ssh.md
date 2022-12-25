SSH publikey

## Check for existing keys

```bash
ls -l ~/.ssh/id*
```
If there are keys already, the output shows the directory contents,
There should be two files: id_rsa and id_rsa.pub.

If the output is "no such file or directory", there are no keys generated for this user

## Generate private key

* Create the .ssh directory
```bash
mkdir ~/.ssh
```
 
* Change the permissions to 700
```bash
chmod 700 ~/.ssh
```

* Generate the keys
```bash
ssh-keygen
```

* The output prints out a message, indicating the command ran successfully. 
Next, the program asks where to save the file, The default directory and file 
for key storage is /home/<username>/.ssh/id_rsa. If you have existing keys you 
want to keep, enter a new file name. Otherwise, press Enter to save in the 
default location. If any keys already exist in this location, the program 
overwrites the data.

* Then you will be prompted to enter a passphrase, type your desired passphrase
then press enter to validate (you will be prompted to type it a second time)
or press enter without typing anythind to not use one.

## Add the publikey to the server

* Check for the ~/.ssh folder on the server and if it does not create it with
the right permissions.

* Check of a file called authorized_keys in the ~/.ssh directory, if none 
exist, create it with 600 permissions

```bash
touch authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

* Copy the key to the server authorized_keys

1. Copy the keys from your local machine

Use this command to copy the key automatically
```bash
ssh-copy-id <username>@<host>
```

2. Copy the keys from the server
Open the authorized_keys file using a text editor. Copy the public key contents into the authorized_keys file. For multiple users and keys, copy each new key onto a new line. Save the file and close.

