## Find
```bash
	find . -name "foo*"
```

## Find by file content
```bash
	find . -type f -exec grep -H 'text-to-find-here' {} \;
```
