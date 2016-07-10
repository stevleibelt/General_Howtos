# read hardware clock

```
hwclock -r
```

# write hardware clock to current system clock

```
hwclock -w
```

# with timedatectl

```
# read
timedatectl status

# write
timedatectl set-time "yyyy-MM-dd hh:mm:ss"
```

# errors

## Failed to set time: Automatic time synchronization is enabled

```
#disable automatic time synchronization
timedatectl set-ntp 0
#set your time
timedatectl set-time '1970-01-01 00:00:00'
```

# links

* https://wiki.archlinux.org/index.php/Hwclock
* http://www.cyberciti.biz/faq/howto-set-date-time-from-linux-command-prompt/
