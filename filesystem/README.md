# Filesystem

## Detect file system

```
#works also for fuseblk
lsblk -no name,fstype
#or
df -T
#or cooler
df -T | awk '{print $1,$2,$NF}' | grep "^/dev"
mount | grep "^/dev"
#not working in all environemnts
blkid
lsblk -fs
fsck -N
file -sl /dev/sdX1
```

## Permissions, date of creation etc.

```
stat <path to file or directory>
```

## Basic check

```
#compare numbers
wc -c /dev/<device>  #can we read all sectors?
#with
fdisk -l /dev/<device>
```

## Check with smartctl

```
#smartctl is in the package smartmontools
smartctl -a /dev/<device>       #list a lot of informations
smartctl -t long /dev/<device>  #start a long test, check with "-a"
```

## Globbing

```
#@see: https://askubuntu.com/a/483192
#matches b and b[a-zA-Z0-9] and longer stuff
b*
#matches b[a-zA-Z0-9] and longer stuff
b?*
```

## Statistic of inodes

```
df -i
# human readable
df -ih
```

## Error

### "too many open files"

#### Current limits

```
#current number of open files
cat /proc/sys/fs/file-nr
<number of allocated file handlers> <number of allocated but unused file handlers> <maximum number of file handlers>

#current limit
cat cat /proc/sys/fs/file-max
```

#### Adapt

```
#set custom limits per user in /etc/security/limits.conf
fs.file-max = <new limit>
sysctl -p
```

## Links

* http://www.thegeekstuff.com/2011/04/identify-file-system-type/
* http://www.rooot.net/en/geek-stuff/linux/15-too-many-open-files.html
* http://www.cyberciti.biz/faq/linux-increase-the-maximum-number-of-open-files/
* https://linuxconfig.org/how-to-force-fsck-to-check-filesystem-after-system-reboot-on-linux

