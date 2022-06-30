# Find and replace in vi/vim/neovim

**Substitute the first occurence of foo in the curent line by bar**
```
:s/foo/bar
```

**Substitute all occurences of foo in the curent line by bar**
```
:s/foo/bar/g
```

**Substitute all occurences of foo in the curent line by bar and confirm each change**
```
:s/foo/bar/gc
```

**Delete all instances of foo in the document**
```
:s/foo//g
```

**Ignore case sensisitivity**
```
:s/foo/bar/gi
```

**Confirm each substitution**
```
:s/foo/bar/gc
```
Press 
"y" to replace the match
"l" to replace the match and quit
"n" to skip the match
"q" or "Esc" to quit substitution
"a" substitute the match and all remaining occurence

**Replace all lines starting "with" foo with "Vim is the best"**
```
:%s/oo.*/Vim is the best/g
```
"^" matches the beginning of a line
".*" matches any number of any characters*


