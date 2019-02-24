# display kernel messages

```
dmesg
#or
cat /proc/kmes
```

# check your journal

```
journalctl | grep -i ' bug '
#
journalctl | grep -i ' error '
```

# get informations about the hardware

```
lscpu
lshw
parted -l   #disk space information
#graphical
hardinfo
```

## cpu

```
cat /proc/cpuinfo
```

## block devices


```
lsblk -O
```

## memory

```
decode --type memory
```

# tools

* memtest86+

# links

* [system information viewer - wiki.archlinux.org](https://wiki.archlinux.org/index.php/List_of_applications/Utilities#System_information_viewers) - 2019-02-22
* https://wiki.archlinux.org/index.php/Stress_Test
* https://www.cyberciti.biz/faq/linux-ram-info-command/
