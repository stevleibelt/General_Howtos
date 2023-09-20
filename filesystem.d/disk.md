# Tools to Check a disk

* smartctl
* badblocks
* vendor specific tools like [seatools](https://aur.archlinux.org/packages/seatools/) (with the superbe name "st") for seagate

## Collection of Disk/Image Cloning Tools

### With examples

#### dd

```
dd if=/dev/sdb3 of=/dev/sdc3 bs=4096 conv=noerror
dd if=/nfs/backup/images/backup.sda1.07.28.12.img of=/dev/sda1 bs=1M conv=noerror
```

#### ddrescue (does not break if data of device is broken)

```
#to another disk
ddrescue /dev/sda /dev/sdb
#as image
ddrescue /dev/sda /mnt/my_sda_image_from.img
```

#### partimage (backup and restore disk partitions into image files)

```
partimage -z1 -o -d save /dev/sda2 /nfs/backup/laptop.wks01.sda1.home_07_08_2012.gz
partimage restore /dev/sda2 /nfs/backup/laptop.wks01.sda1.home_07_08_2012.gz.000
```

### Without examples

| Name with Link | Description |
| --- | --- |
| [clonezilla.org](http://www.clonezilla.org/) | free and open source |
| [Disk2vhd - microsoft.com](https://docs.microsoft.com/en-us/sysinternals/downloads/disk2vhd) | Only for windows, image can be created while windows is running |
| [mondorescue.org](http://www.mondorescue.org/) | free an open source |
| [redobackup.org](http://www.redobackup.org/) | free and open source |
| [trinityhome.org](http://trinityhome.org/) | |
| [sysresccd.org](http://www.sysresccd.org/) | free and open source |
| [ultimate boot cd - ubcd.sourceforge.net](http://ubcd.sourceforge.net/) | free and open source |
| [hdclone - miray.de](http://www.miray.de/download/sat.hdclone.html) | |

### List of Open Source Backup and Restore Utilites

| Name with Link | Description |
| --- | --- |
| [amanda - zmanda.com](http://www.zmanda.com/amanda-community-edition.html) | free and open source |
| [areca-backup.org](http://www.areca-backup.org/) | free and open source |
| [bacula.org](http://www.bacula.org/) | free and open source |
| [backuppc.sourceforge.net](http://backuppc.sourceforge.net/index.html) | free and open source |
| [cobiansoft.com](http://www.cobiansoft.com/cobianbackup.htm) | |
| [duplicati.com](https://www.duplicati.com/) | free and open source |
| [freebyte.com](http://www.freebyte.com/fbbackup/) | |

## Links

* http://www.cyberciti.biz/open-source/linux-based-disk-cloning-imaging-software/
* [hddguru - free software collection](https://hddguru.com/software/) - 2020-03-13
* http://www.thefreecountry.com/utilities/backupandimage.shtml

