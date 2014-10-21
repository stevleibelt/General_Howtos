# create

    zfs snapshot [-r] <pool name>@<snapshot name>

# remove

    zfs destroy <pool name>@<snapshot name>

# list

    zfs list -t snapshot

# rollback

    zfs rollback <pool name>@<snapshot name>

# clone

    zfs clone <pool name>@<snapshot name> <pool name>[/<path>]/<to clone>

# backup

## on same system

    zfs send [-D -R -I <source pool name>@<snapshot name> | zfs receive [-u -d -F] <destination pool name>

## via ssh

    zfs send [-D -R -I <source pool name>@<snapshot name> | ssh backup.me.com zfs recv [-u -d -F]<destination pool name>[/path]

## entire pool

    zfs snapshot -r <source pool>@<snapshot name>
    zfs send -R <source pool name>@<snapshot name> | zfs receive -F <destination pool name>

## hints

* install "pipe view" (pv) to monitor progress

    zfs send <source pool name>[/path]@<snapshot name> | pv | zfs receive <destination pool name[/path]>

* repeat snapshot send and receive at least twice (second run with disabled user access to source pool) to get all data in sync

## rename

    zfs rename <source pool name>@<snapshot name> <destination pool name>@<snapshot name>

# links

* https://wiki.archlinux.org/index.php/ZFS#Experimenting_with_ZFS
* http://docs.huihoo.com/opensolaris/solaris-zfs-administration-guide/html/ch06.html
