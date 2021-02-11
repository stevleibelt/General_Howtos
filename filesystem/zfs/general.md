# prepare empty disk and add gpt/efi lable

```
gdisk /dev/<device>
# create new emtpy GUID parition table
o
Y
# zfs pool
n
enter
enter
enter
bf00
## write changes to disk
w
Y
```

# create pool "my pool"

```
#use one of the following methods to determine you uniq id
lsblk
blkid /dev/sdX
ls -lah /dev/disk/by-uuid
#create your pool
zpool create -f -m </my/mount/point> [-o $propertyName] <my pool>  mirror|raidz id1[ id2[ id3]]
```

# create pool with special sectors

```
#for 512 byte sectors
zpool create <pool name> <first device> [...]

#for 4k sectors
zpool create -o ashift=12 <pool name> mirror <first device> [...]
```

# create data set

```
zfs create <pool name>/<data set name>
#with different mountpoint
zfs create -o mountpoint=<mount point> <pool name>/<data set name>
```
 
# delete data set

```
zfs destroy <pool name>/<data set name>
```

## options

* -r    -   recursively all children
* -R    -   recursively all dependents (also cloned file system outside the hierachy)
* -f    -   force an unmount 
* -n    -   dry run
* -p    -   print machine parseable verbose information
* -v    -   verbose information

# set mountpoint (if needed)

```
zfs set mountpoint=</path/to/mountpoint> <pool name>
zfs set mountpoint=</path/to/mountpoint/of/dataset> <pool name>/<data set name>
```

# set quota

```
# set quota to 10 GB
zfs set quota=10G <pool name>[/<data set name>]

# remove quota
zfs set quota=none <pool name>[/<data set name>]
```

# get all flags of data set

```
zfs get all <pool name>[/<data set name>]
```

# add compression to data set

```
zfs set compression=on <pool name>[/<data set name>]
```

# update access time only when entity is modified

```
#@see https://wiki.archlinux.org/index.php/ZFS#General_2
zfs set atime=on <pool name>[/<data set name>]
zfs set relatime=on <pool name>[/<data set name>]
```

# list data sets

```
#list with space
zfs list -o space

#list by only one zpool and only name (to easy up piping this result into a command)
zfs list -r <pool name> -o name
```

* http://docs.oracle.com/cd/E19253-01/819-5461/gavwg/index.html

```
zpool events -v
zpool history $tank
zpool status -v
zpool status -x
zpool status $tank
zpool clear $tank
```

# list available pools

```
zpool import
```

# import a pool under different name/rename

```
zpool import <source pool name> [<destination pool name>]
```

# rename a data set

```
#can also be used to reallocate/move a pool data set
zfs rename <pool name/source data set name> <pool name/destination data set name>
```

# export a pool

```
zpool export <pool name>
```

# search for pools

```
zpool import -s
```

# try zpool import without mounting it

```
zpool import -N
```

# import pool for current run (not permanently) with different root path

```
zpool import -R </path/to/mountpoint> <pool name>
```

# replace unavailable disk

```
zpool status
zpool detach <pool name> <dead device>
```

# stop scrub

```
zpool scrub -s <pool name>
```

# limit the maximum arc size

```
touch /etc/modprobe.d/zfs.conf
# for a limit of 1 GiB
echo "options zfs zfs_arc_max=1073741824" > /etc/modprobe.d/zfs.conf
# for a limit of 2 GiB
echo "options zfs zfs_arc_max=2147483648" > /etc/modprobe.d/zfs.conf
# for a limit of 4 GiB
echo "options zfs zfs_arc_max=4294967296" > /etc/modprobe.d/zfs.conf
```

# the 4k sector /advanced format performance issue

* lot of common hard disk drives are listed in the [arch linux wiki](https://wiki.archlinux.org/index.php/Advanced_Format)

## how to determine if the hdd has af/4k sectors?

```
cat /sys/class/block/sdX/queue/physical_block_size
cat /sys/class/block/sdX/queue/logical_block_size

hdparm -I /dev/sdX
```


# links

* [Getting started with openZFs](https://openzfs.github.io/openzfs-docs/Getting Started) - 20210211
* http://stoneyforest.net/~chris/blog/freebsd/zfs/maint.html
* https://pthree.org/2012/12/07/zfs-administration-part-iv-the-adjustable-replacement-cache/
* https://wiki.archlinux.org/index.php/ZFS#Encryption_in_ZFS_on_linux
* https://pthree.org/2013/01/03/zfs-administration-part-xvii-best-practices-and-caveats/
* http://docs.oracle.com/cd/E19253-01/819-5461/zfsover-1/index.html
* http://www.freebsd.org/doc/handbook/zfs-term.html#zfs-term-snapshot
* http://www.freebsd.org/doc/handbook/zfs-zfs.html
* http://manpages.ubuntu.com/manpages/maverick/man1/zpool.1M.html
* http://hub.opensolaris.org/bin/download/Community+Group+zfs/docs/zfsadmin.pdf
* http://www.sysadmin-cookbook.net/zfs/
* http://www.solarisinternals.com/wiki/index.php/ZFS_Troubleshooting_Guide
* http://www.funtoo.org/ZFS_Fun
* http://docs.huihoo.com/opensolaris/solaris-zfs-administration-guide/html/ch05s05.html
* http://wiki.nas4free.org/doku.php?id=zfs:main
* http://cuddletech.com/ZFSNinja-Slides.pdf
* https://wiki.archlinux.org/index.php/Experimenting_with_ZFS#Simulate_a_Disk_Failure_and_Rebuild_the_Zpool
* https://wiki.archlinux.org/index.php/ZFS#Embed_the_archzfs_packages_into_an_archiso
* http://solarisinternals.com/wiki/index.php/ZFS_Best_Practices_Guide
* https://fosdem.org/2016/schedule/event/zfs/attachments/slides/869/export/events/attachments/zfs/slides/869/FOSDEM_2016_ZFS.pdf
* http://www.zfsbook.com
* http://wiki.illumos.org/display/illumos/ZFS+and+Advanced+Format+disks
* https://github.com/archzfs/archzfs/issues/77
* [youtube video systems part 1](https://www.youtube.com/watch?v=NRoUC9P1PmA)
* [youtube video systems part 2](https://www.youtube.com/watch?v=TwCXVp_u86o)
* https://docs.oracle.com/cd/E24841_01/html/820-2313/docinfo.html
* https://www.freebsd.org/doc/de_DE.ISO8859-1/books/handbook/zfs.html
* https://pthree.org/2012/12/04/zfs-administration-part-i-vdevs/
* http://open-zfs.org/wiki/Main_Page
* http://zfsonlinux.org/
* http://www.rodsbooks.com/gdisk/sgdisk-walkthrough.html
* https://www.freebsd.org/cgi/man.cgi?query=zpool&sektion=8&apropos=0&manpath=FreeBSD+11.0-RELEASE+and+Ports
* https://www.freebsd.org/cgi/man.cgi?query=zfs&sektion=8&apropos=0&manpath=FreeBSD+11.0-RELEASE+and+Ports
* https://wiki.ubuntu.com/ZFS
* https://wiki.ubuntu.com/Kernel/Reference/ZFS
* https://www.freebsd.org/cgi/man.cgi?query=zdb&sektion=&n=1
* http://louwrentius.com/zfs-performance-and-capacity-impact-of-ashift9-on-4k-sector-drives.html
* https://www.joyent.com/blog/zfs-forensics-recovering-files-from-a-destroyed-zpool
