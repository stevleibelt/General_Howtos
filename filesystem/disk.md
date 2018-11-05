# check a disk

* smartctl
* badblocks
* vendor specific tools like [seatools](https://aur.archlinux.org/packages/seatools/) (with the superbe name "st") for seagate

# open source disk cloning/imaging tools

## dd

```
dd if=/dev/sdb3 of=/dev/sdc3 bs=4096 conv=noerror
dd if=/nfs/backup/images/backup.sda1.07.28.12.img of=/dev/sda1 bs=1M conv=noerror
```

## ddrescue (does not break if data of device is broken)

```
#to another disk
ddrescue /dev/sda /dev/sdb
#as image
ddrescue /dev/sda /mnt/my_sda_image_from.img
```

## partimage (backup and restore disk partitions into image files)

```
partimage -z1 -o -d save /dev/sda2 /nfs/backup/laptop.wks01.sda1.home_07_08_2012.gz
partimage restore /dev/sda2 /nfs/backup/laptop.wks01.sda1.home_07_08_2012.gz.000
```

## clonezilla

[clonezilla.org](http://www.clonezilla.org/)

## Mondo rescue

[mondorescue.org](http://www.mondorescue.org/)

## redo backup and recovery

[redobackup.org](http://www.redobackup.org/)

## Trinity Rescue Kit

[trinityhome.org](http://trinityhome.org/)

## system rescue cd

[sysresccd.org](http://www.sysresccd.org/)

## ultimate boot cd

[ubcd.sourceforge.net](http://ubcd.sourceforge.net/)

## hdclone free edition

[miray.de](http://www.miray.de/download/sat.hdclone.html)

# open source backup and restore utilites

## amanda backup and recovery

[zmanda.com](http://www.zmanda.com/amanda-community-edition.html)

## areca backup

[areca-backup.org](http://www.areca-backup.org/)

## bacula

[bacula.org](http://www.bacula.org/)

## backup pc

[backuppc.sourceforge.net](http://backuppc.sourceforge.net/index.html)


## cobian backup

[cobiansoft.com](http://www.cobiansoft.com/cobianbackup.htm)

## duplicati

[duplicati.com](https://www.duplicati.com/)

## freebyte backup

[freebyte.com](http://www.freebyte.com/fbbackup/)

# links

* http://www.cyberciti.biz/open-source/linux-based-disk-cloning-imaging-software/
* http://www.thefreecountry.com/utilities/backupandimage.shtml
