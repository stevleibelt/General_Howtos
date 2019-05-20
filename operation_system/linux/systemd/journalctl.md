# configuration file

```
/etc/systemd/journald.conf
```

## some configurations

```
Compress=yes
SystemMaxUse=500M
SystemMaxFileSize=100M
RuntimeMaxFileSize=50M
MaxFileSec=1week
```

# view messages from journal

```
strings /var/log/journal<your id>/<journal file name>.journal | grep -i message
```

# options

* -h    - show help
* -l    - show full line view (not truncated)
* -a    - show all fields
* -f    - follow most recent entries
* -e    - jump to the end
* -n    - number of lines to display
* -r    - reverse output (newest first)
* -o    - controls format of output (json, json-pretty, cat, export, short, verbose, ...)
* -x    - extended output with explanation text from catalog
* -q    - quiet output (without any warnings)
* -m    - merged output from all available journals
* -b    - show message from specific boot
* -k    - kernel messages only
* -p    - filter by priority (emerg, alert, crit, err, warning, notice, info, debug)
* -u    - show message of given systemd service unit
* --list-boots  - show list of available boot ids
* --since       - show entries since YYYY-MM-DD[ HH:MM:SS], HH:MM:SS or yesterday etc.
* --until       - show entries until YYYY-MM-DD[ HH:MM:SS]
* --disk-usage  - show current diskusage
* --interval=   - sets fss key pairh generation interval
* --verify      - verifies journal
* --system      - show systemlog
* --user        - show userlog

# tail

```
journalctl -f
```

# general error

```
journalctl -xn
```

# list journal of last boot

```
#positive offset will display boot from the beginning of the journal
#negative offset will display boot from the end of the journal
journalctl -b -1
```

# list journal of current boot with debug priority error and worse

```
jounralctl -b -p err
```

# filter against device or binaries

```
jounrlactl /dev/sdc /usr/sbin/pacman
```

# filter against one unit

```
journalctl --unit=zfs
```

# errors

## list all problems on current boot

```
journalctl -b | grep -i 'fail\|erro\|warn'
```

# clean journal (delete/remove)

```
#clear older 14 days
journalctl --vacuum-time=14d

#clear logs greater size of 2 GiB
journalctl --vacuum-size=2G
```

# links

* http://0pointer.de/blog/projects/journalctl.html
* http://www.freedesktop.org/software/systemd/man/journald.conf.html
* https://ma.ttias.be/clear-systemd-journal/
