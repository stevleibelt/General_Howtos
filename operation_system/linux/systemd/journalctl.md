# Journalctl

## Configuration file

```bash
/etc/systemd/journald.conf
```

## Come configurations

```
Compress=yes
SystemMaxUse=500M
SystemMaxFileSize=100M
RuntimeMaxFileSize=50M
MaxFileSec=1week
```

## Add messages

```bash
#p = priority (emerg, alert, crit, err, warning, notice, info, debug | 0 - 7)
#t = task/identifier
echo "Foo Bar" | systemd-cat -p info -t myapplication
```

## View messages from journal

All your logs are located in `/var/log/journal` or `/run/log/journal`
Choose the right directory.

```bash
#cd <journal path>

#also cool to know
dd if=<journal file> | cat

#way better to read - string displays all ASCII text in this file
strings <journal file>

##and now just grep four your message or pattern
strings <journal file> | grep -i <message or pattern>
```

## Options

* -h    - show help
* -g    - grep
* -l    - show full line view (not truncated)
* -a    - show all fields
* -f    - follow most recent entries
* -F    - List all available values of a particular field in unsorted order (e.g. `journalctl -r _TRANSPORT=syslog`)
* -e    - jump to the end
* -n    - number of lines to display
* -N    - List all available names of fields in unsorted order
* -r    - reverse output (newest first)
* -o    - controls format of output (json, json-pretty, cat, export, short, verbose, ..., e.g. `journalctl -o json -r | jq '[._CMDLINE, .MESSAGE]' | less`)
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
* --dmesg       - outputs the entries in dmesg format

## Tail

```bash
journalctl -f
```

## General error

```bash
journalctl -xn
```

## List journal of last boot

```bash
#positive offset will display boot from the beginning of the journal
#negative offset will display boot from the end of the journal
journalctl -b -1
```

## List journal of current boot with debug priority error and worse

```bash
#show errors and more
journalctl -b -p err

#show only error, critial and alert

journalctl -b -p err..alert
```

## Filter against device or binaries

```bash
jounrlactl /dev/sdc /usr/sbin/pacman
```

## Filter against one unit

```bash
journalctl --unit=zfs
```

## Examples

```bash
#What executables are recorded within 31 days for a service
journalctl -u <string: name>.service --since -31d -o json | jq -r '._EXE' | sort -u

#Get journal for a binary
journalctl /usr/bin/foo
```

## Errors

### List all problems on current boot

```bash
journalctl -b | grep -i 'fail\|erro\|warn'
```

## Clean journal (delete/remove)

```bash
#clear older 14 days
journalctl --vacuum-time=14d
#clear older one month
journalctl --vacuum-time=1month

#clear logs greater size of 2 GiB
journalctl --vacuum-size=2G

#only keep the last four log files
journalctl --vaccum-files=4
```

## Links

* http://0pointer.de/blog/projects/journalctl.html
* http://www.freedesktop.org/software/systemd/man/journald.conf.html
* https://ma.ttias.be/clear-systemd-journal/
* [Using systemd journals to troubleshoot transient problems - opensource.com](https://opensource.com/article/20/8/journals-systemd) - 20200820
* [Some notes on searching the systemd journal with journalctl](https://utcc.utoronto.ca/~cks/space/blog/linux/SystemdJournalctlSearching) - 20230315

