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
zfs snapshot [-r] <string: pool_name>@<string: snapshot_name>

# use -i to create an incremental stream from the first snapshot
zfs snapshot -i <string: pool_name>@<string: first_snapshot_name> <string: pool_name>@<string: second_snapshot_name>
```

## Delete

```bash
#do a dry run (-n) to calculate estimated reclaimed space from the disk
zfs destroy -nv <string: pool_name>@<string: first_snapshot_name>%<string: last_snapshot_name>

#delete one snapshot
zfs destroy <string: pool_name>@<string: snapshot_name>

#remove lot of snapshots with bash
zfs list -t snapshot -o name | grep <string: my_search_pattern> > zfs_snapshot.txt
for SNAPSHOT_NAME in $(cat zfs_snapshot.txt); do zfs destroy "${SNAPSHOT_NAME}"; done
```

### Options

* -d    -   defer snapshopt deletion
* -r    -   recursively all children
* -R    -   recursively all dependents (also cloned file system outside the hierachy)
* -f    -   force an unmount 
* -n    -   dry run
* -p    -   print machine parseable verbose information

## List

```bash
zfs list -t snapshot -o name
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
zfs diff <string: source_snapshot_name> <string: destination_snapshot_name>|<string: file_system>
```

## Rollback / restore

### Full pool

```bash
zfs rollback <string: pool_name>@<string: snapshot_name>
```

### Working with openzfs under linux or restore single file

```bash
mount -t zfs <string: zfs_pool_name>@<string: snapshot_name> </path/to/mount>

#figuring out where is a different
diff -R <path> </path/to/mount/path>

#unmount pool after restore was done
```

## Clone

```bash
zfs clone <string: pool_name>@<string: snapshot_name> <string: pool_name>[/<path>]/<to clone>
```

## Backup

```bash
# On same system
zfs send <string: source_pool_name>[/<string: dataset>]@<string: snapshot name> | zfs receive <string: destination_pool_name>[/<string: dataset>]

# Via ssh
zfs send <string: source_pool_name>@<string: snapshot_name> | ssh backup.me.com zfs receive <string: destination_pool_name>[/path]

# Entire pool or dataset
zfs snapshot -r <source pool>@<snapshot name>
zfs send -R <string: source_pool_name>@<string: snapshot_name> | zfs receive -F <string: destination_pool_name>
```

## Rename

```bash
zfs rename <string: pool_name>@<string: old_snapshot_name> <string: pool_name>@<string: new_snapshot_name>
# same but short
zfs rename <string: pool_name>@<string: old_snapshot_name> <string: new_snapshot_name>
```

## Backup to archive

```bash
zfs send -Rv <string: pool_name>@<string: snapshot_name> | gzip > <string: path_to_archive>.gz
```

### Hints

* Browsing in a snapshot by `ls -halt .zfs/snapshots/<snapshot name>` is not working when openzfs is used
* Install "pipe view" (pv) to monitor progress

```bash
zfs send <string: source_pool_name>[/<string: dataset>]@<string: snapshot name> | pv | zfs receive <string: destination_pool_name[/<string: dataset>]>
```

* Repeat snapshot send and receive at least twice (second run with disabled user access to source pool) to get all data in sync

## Links

* [sanoid - policy-driven snapshot manager](https://github.com/jimsalterjrs/sanoid) - 20231110
* [zrepl - zfs replication: github.io](https://zrepl.github.io/) - 20231110
* https://docs.oracle.com/cd/E23824_01/html/821-1448/recover-3.html
* https://wiki.archlinux.org/index.php/ZFS#Experimenting_with_ZFS
* http://www.freebsd.org/doc/handbook/zfs-zfs.html
* http://googlux.com/zfs-snapshot.html
* http://docs.huihoo.com/opensolaris/solaris-zfs-administration-guide/html/ch06.html
* http://docs.oracle.com/cd/E19253-01/819-5461/gbcya/index.html
