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

* https://wiki.archlinux.org/index.php/Stress_Test
* https://www.cyberciti.biz/faq/linux-ram-info-command/
