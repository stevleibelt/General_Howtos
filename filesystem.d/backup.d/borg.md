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

## Links

* [borgbackup on readthedocks](https://borgbackup.readthedocs.io/) - 20230328
* [borgbackup on wiki.archlinux.org](https://wiki.archlinux.org/title/Borg_backup) - 20230328

