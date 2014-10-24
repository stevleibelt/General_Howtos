# read hardware clock

    hwclock -r

# write hardware clock to current system clock

    hwclock -w

# with timedatectl

    # read
    timedatectl status

    # write
    timedatectl set-time "yyyy-MM-dd hh:mm:ss"

# links

* https://wiki.archlinux.org/index.php/Hwclock
* http://www.cyberciti.biz/faq/howto-set-date-time-from-linux-command-prompt/
