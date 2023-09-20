# Filesystem

## Backup partition table

```bash
sudo sgdisk -b=$(uname -n)-_nvme0n1_partition_table.bin /dev/nvme0n1
```

## Incomplete list of tools

| Name | Description |
| --- | --- |
| cgdisk | Curse based GUID partition table manipulator |
| fixparts | MBR partition table repair utility |
| gdisk | Interactive GUID partition table (GPT) manipulator |
| sgdisk | command line GUID partiton table (GPT) manipulator |

## Detect file system

```bash
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

```bash
stat <path to file or directory>
```

## Basic check

```bash
#compare numbers
wc -c /dev/<device>  #can we read all sectors?
#with
fdisk -l /dev/<device>
```

## Check with smartctl

```bash
#smartctl is in the package smartmontools
smartctl -a /dev/<device>       #list a lot of informations
smartctl -t long /dev/<device>  #start a long test, check with "-a"
```

## Globbing

```bash
#@see: https://askubuntu.com/a/483192
#matches b and b[a-zA-Z0-9] and longer stuff
b*
#matches b[a-zA-Z0-9] and longer stuff
b?*
```

## Statistic of inodes

```bash
df -i
# human readable
df -ih
```

## Error

### "Problem opening /dev/sd[x] for reading! Error is 123."

#### Description of the Error 123

Neither you use `fixparts /dev/sd[x]` or `gdisk /dev/sd[x]`, you get the same error messages.

> Problem opening /dev/sdb for reading! Error is 123.
> 
> Unable to read MBR data from '/dev/sdb'! Exiting!

> sgdisk -o /dev/sdb
> Problem opening /dev/sdb for reading! Error is 123.
> Information: Creating fresh partition table; will override earlier problems!
> Caution! Secondary header was placed beyond the disk's limits! Moving the
> header, but other problems may occur!
> Unable to open device '' for writing! Errno is 2! Aborting write!

#### Investigating the Error 123

First check, if it is read only.

> hdparm -r /dev/sdb
> 
> /dev/sdb:
> readonly      =  0 (off)

Check permissions

> ls -ld /dev/sdb 
> brw-rw---- 1 root disk 8, 16 31. Jan 07:16 /dev/sdb

Check if fdisk can "see" or "list" the device partition

> fdisk -l

Also check what `dmesg` is telling you.

> testdisk /dev/sd[x]

Last option, just write a zero superblock

> mdadm --zero-superblock /dev/sd[x]
> mdadm: Couldn't open /dev/sdb for write - not zeroing

#### Possible options

```bash
wipefs -af /dev/sd[x]
dd if=my.iso of=/dev/sd[x]
```

### "too many open files"

#### Current limits

```bash
#current number of open files
cat /proc/sys/fs/file-nr
<number of allocated file handlers> <number of allocated but unused file handlers> <maximum number of file handlers>

#current limit
cat cat /proc/sys/fs/file-max
```

#### Adapt

```bash
#set custom limits per user in /etc/security/limits.conf
fs.file-max = <new limit>
sysctl -p
```

## Links

* http://www.thegeekstuff.com/2011/04/identify-file-system-type/
* http://www.rooot.net/en/geek-stuff/linux/15-too-many-open-files.html
* http://www.cyberciti.biz/faq/linux-increase-the-maximum-number-of-open-files/
* https://linuxconfig.org/how-to-force-fsck-to-check-filesystem-after-system-reboot-on-linux

