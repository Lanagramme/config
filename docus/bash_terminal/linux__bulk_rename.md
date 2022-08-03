# Bulk rename in bash

rename many files with one command

```
for i in *-doc-*.txt; do mv "$i" "${i/*-doc-/doc-}"; done
```

# Add as string in the beginning of all selected files

```
for f in *;do mv -v "$f" "string${f}";done
```

# Bulk rename with util-linux

Debian-based distro ship with the util-linux package, which comes with a tool called rename.ul which allow the renaming of files on linux.

```
	rename.ul file photo *.png
	# rename all png files in the current directory by replacing every instance of "file" by "photo"
```


