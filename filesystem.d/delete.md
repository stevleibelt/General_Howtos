# Delete a filesystem or files

## Safe delete files

```
#just one file
wipe /path/to/the/file
#recursive
wipe -r /path/to/the/files
```

## Safe delete a filesystem

```
#be verbose
shred -v /dev/<device>
```

## links

* [arch wiki](https://wiki.archlinux.org/index.php/Securely_wipe_disk#Overwrite_the_target)

