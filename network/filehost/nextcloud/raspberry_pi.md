# alpinelinux

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

# links

* [>>Automatic Nextcloud Installation on Raspberry Pi<<](http://unixetc.co.uk/2017/11/25/automatic-nextcloud-installation-on-raspberry-pi/) - 2017-11-25
* [>>Simple Nextcloud Installation on Raspberry Pi<<](http://unixetc.co.uk/2016/11/20/simple-nextcloud-installation-on-raspberry-pi/) - 2016-11-20
* [>>NEXTCLOUD ON THE RASPBERRY PI - DIY DROPBOX!<<](https://www.instructables.com/id/NextCloud-on-the-Raspberry-Pi-DIY-Dropbox/) - 2017?
* [>>NextCloudPi, a ready to use NextCloud image for Raspberry Pi<<](https://ownyourbits.com/2017/02/13/nextcloud-ready-raspberry-pi-image/) - 2017-02-13
