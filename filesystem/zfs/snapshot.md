# general

* a snapshot is a read only copy of the filesystem
* when taken, it consumes nearly now additional disk space
* a snapshot grows when data of the filesystem changes

# create

* use -R to create a replication stream package (contains all properties, snapshots, descendent filesystems, clones ...
* use -D to create a deduplicated stream
* use -p to add the datasets properties to the stream
* use -n to do a dry run
* use -P to print machine-parsable verbose information
* use -v to print verbose informations

```
# use "-r" for all descendent file systems (recursive)
zfs snapshot [-r] <pool name>@<snapshot name>

# use -i to create an incremental stream from the first snapshot
zfs snapshot -i <pool name>@<first snapshot name> <pool name>@<second snapshot name>
```

# delete

```
zfs destroy <pool name>@<snapshot name>
```

## options

* -d    -   defer snapshopt deletion
* -r    -   recursively all children
* -R    -   recursively all dependents (also cloned file system outside the hierachy)
* -f    -   force an unmount 
* -n    -   dry run
* -p    -   print machine parseable verbose information

# list

```
zfs list -t snapshot
```

# diff

## options

* -F    display type of file
* -H    give more (human readable) parsable informations
* -t    display paths inode change time

## output

* -     the path has been removed
* +     the path has been added
* M     the path has been modified
* R     the path has been renamed

```
zfs diff <source snapshot name> <destination snapshot name>|<file system>
```

# rollback / restore

```
zfs rollback <pool name>@<snapshot name>
```

# clone

```
zfs clone <pool name>@<snapshot name> <pool name>[/<path>]/<to clone>
```

# backup

## on same system

```
zfs send <source pool name>@<snapshot name> | zfs receive <destination pool name>
```

## via ssh

```
zfs send <source pool name>@<snapshot name> | ssh backup.me.com zfs recv <destination pool name>[/path]
```

## entire pool

```
zfs snapshot -r <source pool>@<snapshot name>
zfs send -R <source pool name>@<snapshot name> | zfs receive -F <destination pool name>
```

# rename

```
zfs rename <pool name>@<old snapshot name> <pool name>@<new snapshot name>
# same but short
zfs rename <pool name>@<old snapshot name> <new snapshot name>
```

# browse in the snapshot

```
#assuming your root is your pool
cd /.zfs/snapshot/<snapshot name>
ls -halt
```

# backup to archive

```
zfs send -Rv <pool name>@<snapshot name> | gzip > <path to archive>.gz
```

## hints

* install "pipe view" (pv) to monitor progress

```
zfs send <source pool name>[/path]@<snapshot name> | pv | zfs receive <destination pool name[/path]>
```

* repeat snapshot send and receive at least twice (second run with disabled user access to source pool) to get all data in sync

# links

* https://docs.oracle.com/cd/E23824_01/html/821-1448/recover-3.html
* https://wiki.archlinux.org/index.php/ZFS#Experimenting_with_ZFS
* http://www.freebsd.org/doc/handbook/zfs-zfs.html
* http://googlux.com/zfs-snapshot.html
* http://docs.huihoo.com/opensolaris/solaris-zfs-administration-guide/html/ch06.html
* http://docs.oracle.com/cd/E19253-01/819-5461/gbcya/index.html
