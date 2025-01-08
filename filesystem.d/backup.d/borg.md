# Borg

## Kickstart

```bash
# ref: https://borgbackup.readthedocs.io/en/stable/
# setup
## create a repository
borg init -e repokey /path/to/the/backup

## export repository key to store it somewhere
borg key export /path/to/the/backup

## create exclude file
vim ~/.config/borg/borgexcluded.txt
# Add one excluded full qualified file path per line

# use it
## create backup
borg create --exclude-caches --exclude-from "${HOME}/.config/borg/borgexcluded.txt" /path/to/the/backup::{hostname}-{now:%Y-%m-%d_%H:%M:%S} ${HOME}

## prune
borg prune --keep-daily=7 --keep-weekly=4 /path/to/the/backup

## compact
borg compact /path/to/the/backup

# good to know
borg mount /path/to/the/backup /tmp/my_temporary_mountpoint
borg list /path/to/the/backup               # list content of the given repository or archive
borg info /path/to/the/backup [--last 1]    #shows info like size for a given repository or archive
```

## Errorhandling

### segment 1234 not found, but listed in compaction data

This error message indicates a inconsistency in the repository happened during the compacting process.
The segemnt file 1234 was expected but could not be found in the data.

This could happen by an interrupted synchronisation or indicates a hardware error.

How to solve it?

```bash
# check repository
# borg will tell you what is wrong
borg check /path/to/the/backup

# repair issues
# borg tries to rebuild missing or corrupted repository data
borg check --repair /path/to/the/backup

# rebuild index
# borg rebuilds the index because the issue is not on the filesystem
borg recreate --target /path/to/the/backup

# manually check
# cd /path/to/the/backup
# search for proper file or directory fitting your invalid segment

# if you can not reciver the missing segment file and the repository is unusable
#   force borg to ignore the missing segment
borg prune --force /path/to/the/backup
``` 

## Links

* [borgbackup on readthedocks](https://borgbackup.readthedocs.io/) - 20230328
* [borgbackup on wiki.archlinux.org](https://wiki.archlinux.org/title/Borg_backup) - 20230328

