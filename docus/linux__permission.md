# Permission in linux

## Introduction

```
ls -l
```

Give informations about permissions in the pwd

drwxr-xr-x username group 1234 Mar  5 01:21 Directory
-rw-r--r-x username group username 1234 Mar  5 01:21 File
-rw-rw-r-- username group 1234 Mar  5 01:21 File
drwxr-xr-x username group 1234 Mar  5 01:21 Directory

* The first character in a line can either be a `-`, which means it's a file, of a `d`, which means it's a directory
* The next nine characters (rw-r-r-) show the security; we'll talk about them later.
* The next column shows the owner of the file.
* The next column shows the group owner of the file.
* The next column shows the size of the file in bytes.
* The next column shows the las time the file was modified.
* The last column gives the name of the file.

## Undestanding the security permission

The nine characters following the 'd' or '-' at the beginning of the line describes the permissions for the file or directory, by sets of three.

---   ---    ---
rwx   rwx    rwx
user  group  other

The 'r' stands for "read"
The 'w' stands for "write"
The 'x' stands for "execute"
If any of those character is replaced by a '-', that permission has been revoked.
