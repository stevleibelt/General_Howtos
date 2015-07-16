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

# error

## "too many open files"

### current limits

    cat /proc/sys/fs/file-nr
    <number of allocated file handlers> <number of allocated but unused file handlers> <maximum number of file handlers>

### adapt

    #set custom limits per user in /etc/security/limits.conf
    fs.file-max = <new limit>
    sysctl -p

# links

* http://www.thegeekstuff.com/2011/04/identify-file-system-type/
* http://www.rooot.net/en/geek-stuff/linux/15-too-many-open-files.html
