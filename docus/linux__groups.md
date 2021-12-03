# Groups on linux

## Add a new group

```
sudo groupadd newgroup
```

## Add an existing user account to a group

```
usermod -a -G group username
```

## Change a user's primary group

```
usermod -g groupname username
```
