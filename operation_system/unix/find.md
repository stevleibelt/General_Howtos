# find files by user foo or bar

    find /my/path \( -user foo -o -user bar \) -ls

# find files by user foo and not in group bar

    find /my/path -user foo -not -group bar -ls

# find files by user foo and by size of greater then one mb

    find /my/path -user foo -and -size +1M -ls

# delete all files

    find /var/log -type f -delete

## delete all .gz and rotated files

    find /var/log -type -f -regex ".*\.gz$"
    find /var/log -type -f -regex ".*\.[0-9]$"
