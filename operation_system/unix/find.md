# find files by user foo or bar

    find /my/path \( -user foo -o -user bar \) -ls

# find files by user foo and not in group bar

    find /my/path -user foo -not -group bar -ls

# find files by user foo and by size of greater then one mb

    find /my/path -user foo -and -size +1M -ls

# find by time

* -amin     -   acces in last n minutes
* -atime    -   access time last n*24 hours
* -cmin     -   file status changed in n minutes
* -ctime    -   change time last n*24 hours
* -mtime    -   modified time last n*24 hours (n = n+1 day, -n = older than, +n = newer than)

    find . -mtime 0             # find files modified between now and 1 day ago
                                # (i.e., within the past 24 hours)
    find . -mtime -1            # find files modified less than 1 day ago
                                # (i.e., within the past 24 hours, as before)
    find . -mtime 1             # find files modified between 24 and 48 hours ago
    find . -mtime +1            # find files modified more than 48 hours ago

    find . -mmin +5 -mmin -10   # find files modified between
                                # 6 and 9 minutes ago

## gnu find

    find . -newerat '2 hours ago'   # find files accessed last two hours
    find . -newerct '2 hours ago'   # find files created last two hours
    find . -newermt '2 hours ago'   # find files modified last two hours

    find . ! -newerat '2 hours ago'   # find files accessed more than two hours
    find . ! -newerct '2 hours ago'   # find files created more than two hours
    find . ! -newermt '2 hours ago'   # find files modified more than two hours

# delete all files

    find /var/log -type f -delete

## delete all .gz and rotated files

    find /var/log -type -f -regex ".*\.gz$"
    find /var/log -type -f -regex ".*\.[0-9]$"

# links

* [finduntils](http://www.gnu.org/software/findutils/findutils.html)
* [findcmd](http://content.hccfl.edu/pollock/unix/findcmd.htm)
* [ubuntuusers.de](http://wiki.ubuntuusers.de/find)
