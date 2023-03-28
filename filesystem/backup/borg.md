# Borg

## Kickstart

```bash
# setup
## create a repository
borg init --encryption=repokey /path/to/the/backup

## export repository key to store it somewhere
borg key export /path/to/the/backup

## create exclude file
vim ~/.config/borg/borgexcluded.txt
# Add one excluded full qualified file path per line

# use it
## create backup
borg create --exclude-caches --exclude-from "${HOME}/.config/borg/borgexcluded.txt" /path/to/the/backup ${HOME}

## prune
borg prune --keep-daily=7 --keep-weekly=4 /path/to/the/backup
```

## Links

* [borgbackup on readthedocks](https://borgbackup.readthedocs.io/) - 20230328
* [borgbackup on wiki.archlinux.org](https://wiki.archlinux.org/title/Borg_backup) - 20230328

