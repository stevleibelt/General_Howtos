# set gpu memory

```
vim /boot/config.text

search for "gpu" and set fitting entry
```

## links

* http://hubcitylabs.org/unlocking-your-new-raspberry-pis-512mb-of-memory/
* http://elinux.org/RPiconfig

# set cpu frequencies

```
vim /boot/config.text

uncomment fitting "arm_freq" entries
```

# wifi

* https://wiki.archlinux.org/index.php/Beginners%27_guide#Wireless
* http://archpi.dabase.com/#wireless

# statistic

## temperature

```
awk '{printf "%3.1f°C\n", $1/1000}' /sys/class/thermal/thermal_zone0/temp
```

# GPIO

```
watch -n 0.5 gpio readall
```

# arch linux

## packages

```
pacman -S fake-hwclock nss-mdns
#nice to have
pacman -S base-devel htop lsof git nmon vim
```

## speed improvment

```
#/etc/fstab
#add "noatime" option to your disk
```

# Links

* https://wiki.gentoo.org/index.php?title=Raspberry_Pi&redirect=no:wq
* http://blog.philippklaus.de/2013/03/fix-time-on-arch-linux-systems-run-ntpd-s-every-hour-using-systemd/
* https://wiki.archlinux.org/index.php/Raspberry_Pi
* http://archpi.dabase.com/
* https://wiki.archlinux.org/index.php/Solid_State_Drives#Tips_for_minimizing_disk_reads.2Fwrites
* https://wiki.archlinux.org/index.php/Benchmarking#Flash_media
* https://wiki.archlinux.org/index.php/Fsck#Boot_time_checking
