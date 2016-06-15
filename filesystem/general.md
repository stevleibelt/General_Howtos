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

# basic check

```
#compare numbers
wc -c /dev/<device>  #can we read all sectors?
#with
fdisk -l /dev/<device>
```

# check with smartctl

```
#smartctl is in the package smartmontools
smartctl -a /dev/<device>       #list a lot of informations
smartctl -t long /dev/<device>  #start a long test, check with "-a"
```

# globbing

```
#@see: https://askubuntu.com/a/483192
#matches b and b[a-zA-Z0-9] and longer stuff
b*
#matches b[a-zA-Z0-9] and longer stuff
b?*
```

# statistic of inodes

```
df -i
# human readable
df -ih
```

# error

## "too many open files"

### current limits

```
#current number of open files
cat /proc/sys/fs/file-nr
<number of allocated file handlers> <number of allocated but unused file handlers> <maximum number of file handlers>

#current limit
cat cat /proc/sys/fs/file-max
```

### adapt

```
#set custom limits per user in /etc/security/limits.conf
fs.file-max = <new limit>
sysctl -p
```

# links

* http://www.thegeekstuff.com/2011/04/identify-file-system-type/
* http://www.rooot.net/en/geek-stuff/linux/15-too-many-open-files.html
* http://www.cyberciti.biz/faq/linux-increase-the-maximum-number-of-open-files/
