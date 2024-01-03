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
cat /proc/cpuinfo
dmidecode -t <string: type>
hwinfo  # prepare yourself for a lot of lines
lscpu
lsblk -O
lspci
lshw
lsusb
parted -l   #disk space information

# gui
hardinfo
```

* Test your memory with memtest86+

## Links

* [16 Commands to Check Hardware Information on Linux](https://www.binarytides.com/linux-commands-hardware-info/) - 20240103
* [7 Linux commands to gather information about your system](https://www.redhat.com/sysadmin/linux-system-info-commands) - 20240103
* [System information viewer - wiki.archlinux.org](https://wiki.archlinux.org/index.php/List_of_applications/Utilities#System_information_viewers) - 20190222
* https://wiki.archlinux.org/index.php/Stress_Test
* https://www.cyberciti.biz/faq/linux-ram-info-command/
