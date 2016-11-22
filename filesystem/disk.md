# check a disk

* smartctl
* badblocks
* vendor specific tools like [seatools](https://aur.archlinux.org/packages/seatools/) (with the superbe name "st") for seagate

# open source disk cloning/imaging tools

* dd
    dd if=/dev/sdb3 of=/dev/sdc3 bs=4096 conv=noerror
    dd if=/nfs/backup/images/backup.sda1.07.28.12.img of=/dev/sda1 bs=1M conv=noerror
* ddrescue (does not break if data of device is broken)
    ddrescue /dev/sda /dev/sdb
* partimage (backup and restore disk partitions into image files)
    partimage -z1 -o -d save /dev/sda2 /nfs/backup/laptop.wks01.sda1.home_07_08_2012.gz
    partimage restore /dev/sda2 /nfs/backup/laptop.wks01.sda1.home_07_08_2012.gz.000
* clonezilla
    http://www.clonezilla.org/
* Mondo rescue
    http://www.mondorescue.org/
* redo backup and recovery
    http://www.redobackup.org/
* Trinity Rescue Kit
    http://trinityhome.org/
* system rescue cd
    http://www.sysresccd.org/
* ultimate boot cd
    http://ubcd.sourceforge.net/
* hdclone free edition
    http://www.miray.de/download/sat.hdclone.html

# open source backup and restore utilites

* areca backup
    http://www.areca-backup.org/
* bacula
    http://www.bacula.org/
* backup pc
    http://backuppc.sourceforge.net/index.html
* amanda backup and recovery
    http://www.zmanda.com/amanda-community-edition.html
* cobian backup
    http://www.cobiansoft.com/cobianbackup.htm
* freebyte backup
    http://www.freebyte.com/fbbackup/

# links

* http://www.cyberciti.biz/open-source/linux-based-disk-cloning-imaging-software/
* http://www.thefreecountry.com/utilities/backupandimage.shtml
