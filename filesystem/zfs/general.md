# prepare empty disk and add gpt/efi lable

gdisk /dev/myDevice

# create tank "myTank"

ls -lah /dev/disk/by-id
zpool create -f -m /my/mount/point pool-name  mirror|raidz id1[ id2[ id3]]

# create data set

zfs create myTank/myDataSet

# set mountpoint (if needed)

zfs set mountpoint=/path/to/mountpoint myTank
zfs set mountpoint=/foo/bar myTank/myFileSystem

# set quota

zfs set quota=10G boo/bar
zfs set quota=none boo/bar

# get all flags

zfs get all myTank

# add compression to fileSystem

zfs set compression=on myTank/myFileSystem

* http://docs.oracle.com/cd/E19253-01/819-5461/gavwg/index.html

zpool events -v
zpool history $tank
zpool status -v
zpool status -x
zpool status $tank
zpool clear $tank

# list available pools

zpool import

# import a pool under different name

zpool import $pool $my-other-name

# try zpool import without mounting it

zpool import -N

# import pool for current run (not permanently) with different root path

zpool import -R /path/to/mountpoint zpoolId

# snapshot

## create

zfs snapshot [-r] myTank@mySnapshotName

## list

zfs list -t snapshot

## rollback

zfs rollback myTank@mySnapshopName

## clone

zfs clone myTank@mySnapshotName myTank/myFileSystem/myClone

## backup on same system

zfs send [-D -R -I myTank@mySnapshopName | zfs receive [-u -d -F] myOtherTank

## backup via ssh

zfs send [-D -R -I @snapshot | ssh backup.me.com zfs recv [-u -d -F]tank/backup

## backup entire pool

zfs snapshot -r sourcePool@backupSnapshot
zfs send -R sourcePool@backupSnapshot | zfs receive -F destinationPool

## hints

* install "pipe view" (pv) to monitor progress
    zfs send sourceTank/[filesystem]@mySnapshotName | pv | zfs receive destinationPool/[filesystem]
* repeat snapshot send and receive at least twice (second run with disabled user access to source pool) to get all data in sync

## rename

zfs rename myTank@mySnapshotName myTank@myOtherSnapshotName

# replace unavailable disk

* zpool status
* zpool detach $pool $dead-device

# stop scrub

* zpool scrub -s $pool

# links

* http://docs.oracle.com/cd/E19253-01/819-5461/zfsover-1/index.html
* http://manpages.ubuntu.com/manpages/maverick/man1/zpool.1M.html
* http://hub.opensolaris.org/bin/download/Community+Group+zfs/docs/zfsadmin.pdf
* http://www.sysadmin-cookbook.net/zfs/
* http://www.solarisinternals.com/wiki/index.php/ZFS_Troubleshooting_Guide
* http://www.funtoo.org/ZFS_Fun
* http://docs.huihoo.com/opensolaris/solaris-zfs-administration-guide/html/ch05s05.html
* http://wiki.nas4free.org/doku.php?id=zfs:main
* http://cuddletech.com/ZFSNinja-Slides.pdf
