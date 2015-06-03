# detect file system

```
lsblk -fs
df -T | awk '{print $1,$2,$NF}' | grep "^/dev"
fsck -N
file -sl /dev/sdX1
mount | grep "^/dev"
```

# permissions

```
stat <path to file or directory>
```

# links

* http://www.thegeekstuff.com/2011/04/identify-file-system-type/
