# create

zfs snapshot [-r] myTank@mySnapshotName

# remove

zfs destroy myTank@mySnapshotName

# list

zfs list -t snapshot

# rollback

zfs rollback myTank@mySnapshopName

# clone

zfs clone myTank@mySnapshotName myTank/myFileSystem/myClone

# backup

## on same system

zfs send [-D -R -I myTank@mySnapshopName | zfs receive [-u -d -F] myOtherTank

## via ssh

zfs send [-D -R -I @snapshot | ssh backup.me.com zfs recv [-u -d -F]tank/backup

## entire pool

zfs snapshot -r sourcePool@backupSnapshot
zfs send -R sourcePool@backupSnapshot | zfs receive -F destinationPool

## hints

* install "pipe view" (pv) to monitor progress
    zfs send sourceTank/[filesystem]@mySnapshotName | pv | zfs receive destinationPool/[filesystem]
* repeat snapshot send and receive at least twice (second run with disabled user access to source pool) to get all data in sync

## rename

zfs rename myTank@mySnapshotName myTank@myOtherSnapshotName

# links

* http://docs.huihoo.com/opensolaris/solaris-zfs-administration-guide/html/ch06.html
