# alpine linux

## steps

* [download](https://wiki.alpinelinux.org/wiki/Raspberry_Pi)
* fdisk /dev/<path to the sd card>
* d - until all partitions are gone
* o
* n
* p
* enter
* enter
* enter
* l
* c
* w
* (if needed, install dosfstools and ntfsprogs)
* mkfs.vfat -F 32 /dev/<path to the sd card>
* mount /dev/<path to the sd card> /mnt
* tar -xzf alpine-rpi-\*.tar.gz -C /mnt
* vim /mnt/config.txt
* [adapt](https://www.raspberrypi.org/documentation/configuration/config-txt/) if needed
* sync
* umount /mnt
* put it into your pi
* loing as "root" without password
* setup-alpine
* lbu commit -d

* fdisk /dev/<path to the sd card>
* create two partitions
* first with a size of 512 mb (which is way to much for alpine but we a prepared for anything that comes)
* first paritition type is c (W95 FAT32)
* first partition flags are LBA and bootbale
* second partition is the rest
* mkfs.vfat -F 32 /dev/<path to the sd card>1
* mkfs.ext4 /dev/<path to the sd card>2
* mount /dev/<path to the sd card>1 /mnt
* cat >> /mnt/usercfg.txt <<DELIM
enable_uart=1
DELIM
* umount /mnt
* sync
* plug sd card in raspberry pi
* login as "root" without password
* setup-alpine
* lbu commit -d
* reboot
* apk update
* apk upgrade
* apk add chrony
* service chronyd restart
* apk add e2fsprogs
* mount /dev/mmcblk0p2 /mnt
* setup-disk -m sys /mnt
* mount -o remount,rw /dev/mmcblk0p1
* rm -f /media/mmcblk0p1/boot/*  
* cd /mnt
* rm boot/boot
* mv boot/* /media/mmcblk0p1/boot/ 
* rm -Rf boot
* mkdir media/mmcblk0p1
* ln -s media/mmcblk0p1/boot boot
* echo "/dev/mmcblk0p1 /media/mmcblk0p1 vfat defaults 0 0" >> etc/fstab
* sed -i '/cdrom/d' etc/fstab   # Of course, you don't have any cdrom or floppy on the Raspberry Pi
* sed -i '/floppy/d' etc/fstab
* cd /media/mmcblk0p1
* sed -i '/edge/s/^#//' etc/apk/repositories
* sed -i 's/^/root=\/dev\/mmcblk0p2 /' cmdline.txt  
* lbu commit -d
* reboot #be patient
* rc-update del hwclock boot
* rc-update add swclock boot
* service hwclock stop
* service swclock start
* apk add vim htop sudo
* htop
* adduser <user name> wheel
* visudo
* rc-update

### example fdisk output from a 4 GB card

```
Disk /dev/mmcblk0: 3.7 GiB, 3965190144 bytes, 7744512 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x03073934

Device         Boot   Start     End Sectors  Size Id Type
/dev/mmcblk0p1 *       2048 1050623 1048576  512M  c W95 FAT32 (LBA)
/dev/mmcblk0p2      1050624 7743487 6692864  3.2G 83 Linux

Command (m for help):
```

## links

* [>>Automatic Nextcloud Installation on Raspberry Pi<<](http://unixetc.co.uk/2017/11/25/automatic-nextcloud-installation-on-raspberry-pi/) - 2017-11-25
* [>>Simple Nextcloud Installation on Raspberry Pi<<](http://unixetc.co.uk/2016/11/20/simple-nextcloud-installation-on-raspberry-pi/) - 2016-11-20
* [>>NEXTCLOUD ON THE RASPBERRY PI - DIY DROPBOX!<<](https://www.instructables.com/id/NextCloud-on-the-Raspberry-Pi-DIY-Dropbox/) - 2017?
* [>>NextCloudPi, a ready to use NextCloud image for Raspberry Pi<<](https://ownyourbits.com/2017/02/13/nextcloud-ready-raspberry-pi-image/) - 2017-02-13

# raspbian

## steps

* [download](https://www.raspberrypi.org/downloads/raspbian/) raspbian lite
* unzip downloaded zip
* dd bs=4M if=<path to the image> of=/path/to/the/sdcard conv=fsync
* login pi/raspberry
* [start ssh server](https://www.raspberrypi.org/documentation/remote-access/ssh/)
    * sudo raspi-config
    * navigate to >>Interfacing Options<< -> >>SSH<< -> >>YES<< -> >>OK<< -> >>Finish<<
    * sudo systemctl enable ssh
    * sudo systemctl start ssh
    * ip a
* ssh pi@<ip address>
* sudo apt-get update
* sudo apt-get dist-upgrade

## links 

* [Traditional disk-based (sys) installation](https://wiki.alpinelinux.org/wiki/Raspberry_Pi#Traditional_disk-based_.28sys.29_installation)
* [Raspberry Alpine Linux 3.5 Docker Host](https://codegazers.wordpress.com/2017/01/01/raspberry-alpine-docker/) - 2017-01-01
* [Classic install or sys mode on Raspberry Pi](https://wiki.alpinelinux.org/wiki/Classic_install_or_sys_mode_on_Raspberry_Pi)
