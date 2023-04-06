# ZFS snapshot

## General

* a snapshot is a read only copy of the filesystem
* when taken, it consumes nearly now additional disk space
* a snapshot grows when data of the filesystem changes

## Create

* use -R to create a replication stream package (contains all properties, snapshots, descendent filesystems, clones ...
* use -D to create a deduplicated stream
* use -p to add the datasets properties to the stream
* use -n to do a dry run
* use -P to print machine-parsable verbose information
* use -v to print verbose informations

```bash
# use "-r" for all descendent file systems (recursive)
zfs snapshot [-r] <pool name>@<snapshot name>

# use -i to create an incremental stream from the first snapshot
zfs snapshot -i <pool name>@<first snapshot name> <pool name>@<second snapshot name>
```

## Delete

```bash
#do a dry run (-n) to calculate estimated reclaimed space from the disk
zfs destroy -nv <pool name>@<first snapshot name>%<last snapshot name>

#delete one snapshot
zfs destroy <pool name>@<snapshot name>
```

### Options

* -d    -   defer snapshopt deletion
* -r    -   recursively all children
* -R    -   recursively all dependents (also cloned file system outside the hierachy)
* -f    -   force an unmount 
* -n    -   dry run
* -p    -   print machine parseable verbose information

## List

```
zfs list -t snapshot
```

## Diff

### Options

* -F    display type of file
* -H    give more (human readable) parsable informations
* -t    display paths inode change time

### Output

* -     the path has been removed
* +     the path has been added
* M     the path has been modified
* R     the path has been renamed

```bash
zfs diff <source snapshot name> <destination snapshot name>|<file system>
```

## Rollback / restore

### Full pool

```bash
zfs rollback <pool name>@<snapshot name>
```

### Working with openzfs under linux or restore single file

```bash
mount -t zfs <zfs pool>@<snapshot> </path/to/mount>

#figuring out where is a different
diff -R <path> </path/to/mount/path>

#unmount pool after restore was done
```

## Clone

```bash
zfs clone <pool name>@<snapshot name> <pool name>[/<path>]/<to clone>
```

## Backup

### On same system

```bash
zfs send <source pool name>@<snapshot name> | zfs receive <destination pool name>
```

### Via ssh

```bash
zfs send <source pool name>@<snapshot name> | ssh backup.me.com zfs recv <destination pool name>[/path]
```

### Entire pool

```bash
zfs snapshot -r <source pool>@<snapshot name>
zfs send -R <source pool name>@<snapshot name> | zfs receive -F <destination pool name>
```

## Rename

```bash
zfs rename <pool name>@<old snapshot name> <pool name>@<new snapshot name>
# same but short
zfs rename <pool name>@<old snapshot name> <new snapshot name>
```

## Backup to archive

```bash
zfs send -Rv <pool name>@<snapshot name> | gzip > <path to archive>.gz
```

### Hints

* Browsing in a snapshot by `ls -halt .zfs/snapshots/<snapshot name>` is not working when openzfs is used
* Install "pipe view" (pv) to monitor progress

```bash
zfs send <source pool name>[/path]@<snapshot name> | pv | zfs receive <destination pool name[/path]>
```

* Repeat snapshot send and receive at least twice (second run with disabled user access to source pool) to get all data in sync

## Links

* https://docs.oracle.com/cd/E23824_01/html/821-1448/recover-3.html
* https://wiki.archlinux.org/index.php/ZFS#Experimenting_with_ZFS
* http://www.freebsd.org/doc/handbook/zfs-zfs.html
* http://googlux.com/zfs-snapshot.html
* http://docs.huihoo.com/opensolaris/solaris-zfs-administration-guide/html/ch06.html
* http://docs.oracle.com/cd/E19253-01/819-5461/gbcya/index.html

