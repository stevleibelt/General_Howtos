# configuration file

    /etc/systemd/journald.conf

## some configurations

    * Compress=yes
    * SystemMaxFileSize=100M
    * RuntimeMaxFileSize=50M
    * MaxFileSec=1week

# tail

    journalctl -f

# general error

    journalctl -xn

# list journal of current boot

    journalctl -b

# list journal of current boot with debug level error and worse

    jounralctl -b -p err

# filter against device or binaries

    jounrlactl /dev/sdc /usr/sbin/pacman

# filter against one unit

    journalctl --unit=zfs

# links

* http://0pointer.de/blog/projects/journalctl.html
* http://www.freedesktop.org/software/systemd/man/journald.conf.html
