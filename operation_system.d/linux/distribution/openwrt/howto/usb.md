# How to use usb storage

[source usb drives](https://openwrt.org/docs/guide-user/storage/usb-drives) - 20220218

[source quick start usb drives](https://openwrt.org/docs/guide-user/storage/usb-drives-quickstart) - 20220218

## Install basic packages and verify all is working

```
opkg update && opkg install block-mount e2fsprogs kmod-fs-ext4 kmod-usb-storage kmod-usb2 kmod-usb3 usbutils
reboot

#check ext4 is now supported
cat /proc/filesystems

#connet your usb device
lsusb -t

#check available devices
ls -l /dev/sd*
```

## Setup automout

```
#install package
opkg install block-mount

#create entry in fstab
block detect | uci import fstab

#enable automount
uci set fstab.@mount[-1].enabled='1'
uci commit fstab

#optional: enable autocheck
uci set fstab.@global[0].check_fs='1'
uci commit fstab

#reboot to check output is working fine
#_or trigger fstab on your own
#/etc/init.d/fstab boot
```

Go tu LuCi `System` -> `Mount Points` and check if your usb device has an enabled mountpoint.

## On error

```
#mount things on your own
mount -t ex4 /dev/sda1 /mnt/sda1
```
