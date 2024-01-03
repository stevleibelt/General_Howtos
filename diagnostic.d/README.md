# Fetching system information

## Display kernel messages

```bash
dmesg
#or
cat /proc/kmes
```

## Check your journal

```
journalctl | grep -i ' bug '
#
journalctl | grep -i ' error '
```

## Get informations about the hardware

```bash
# cli
lscpu
lshw
dmidecode -t <string: type>
# lots of text
hwinfo
parted -l   #disk space information
# gui
hardinfo
```

## cpu

```bash
cat /proc/cpuinfo
```

## block devices


```bash
lsblk -O
```

## memory

```bash
decode --type memory
```

* Test your memory memtest86+

## Links

* [7 Linux commands to gather information about your system](https://www.redhat.com/sysadmin/linux-system-info-commands) - 20240103
* [System information viewer - wiki.archlinux.org](https://wiki.archlinux.org/index.php/List_of_applications/Utilities#System_information_viewers) - 20190222
* https://wiki.archlinux.org/index.php/Stress_Test
* https://www.cyberciti.biz/faq/linux-ram-info-command/
