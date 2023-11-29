# installation

## with lvm

```
#install lvm
modprobe dm-mod
echo dm-mod >> /etc/modules
apk add e2fsprogs lvm2 syslinux

#prepare disk
#assuming your host name is foo01 and your device is /dev/sda

fdisk /dev/sda

o
n
p
1
<enter>
+256M
83
n
p
2
<enter>
<enter>
8e

#@todo move the disk steps to a generic howto/filesystem/lvm/example.md and link it here.

lvmdiskscan

pvcreate /dev/sda2

vgcreate foo01vg0 /dev/sda2

#lvcreate -l 100%Free
lvcreate -n boot -L 512M foo01vg0
lvcreate -n etc -L 2G foo01vg0
lvcreate -n home -L 8G foo01vg0
lvcreate -n root -L 8G foo01vg0
lvcreate -n swap -L 2G foo01vg0
lvcreate -n tmp -L 2G foo01vg0
lvcreate -n var -L 2G foo01vg0

lvdisplay

vgchange -ay

#format disk

mkfs.ext2 /dev/mapper/foo01vg0/boot
mkfs.ext4 /dev/mapper/foo01vg0/root
mkfs.ext4 /dev/mapper/foo01vg0/etc
mkfs.ext4 /dev/mapper/foo01vg0/var
mkfs.ext4 /dev/mapper/foo01vg0/tmp

#mount file systems
mount -t ext4 /dev/mapper/foo01vg0/root /mnt
mkdir /mnt/boot
mkdir /mnt/etc
mkdir /mnt/tmp
mkdir /mnt/var
mount -t ext2 /dev/mapper/foo01vg0/boot /mnt/boot
mount -t ext4 /dev/mapper/foo01vg0/home /mnt/home
mount -t ext4 /dev/mapper/foo01vg0/etc /mnt/etc
mount -t ext4 /dev/mapper/foo01vg0/var /mnt/var
mount -t ext4 /dev/mapper/foo01vg0/tmp /mnt/tmp

#update init system
rc-update add lvm
rc-update add localmount boot
/etc/init.d/swap start
rc-update add swap

#go on with the regular installation
setup-timezone
setup-alpine -q
setup-sshd
setup-ntp
setup-apkrepros
setup-apkcache
setup-disk -m sys /mnt

#install bootloader
dd bs=440 count=1 conv=notrunc if=/usr/share/syslinux/mbr.bin of=/dev/sda
extlinux --install /mnt/boot

#install xen
apk update
apk add xen xen-hypervisor
```

# available setup scripts

* setup-alpine
* setup-acf
* setup-apkcache
* setup-apkrepros
* setup-bootable
* setup-disk
* setup-dns
* setup-gparted-desktop
* setup-hostname
* setup-interfaces
* setup-keymap
* setup-lbu
* setup-mta
* setup-ntp
* setup-proxy
* setup-sshd
* setup-timezone
* setup-xen-dom0
* setup-xorg-base

# link

* https://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management
* https://wiki.alpinelinux.org/wiki/Setting_up_LVM_on_GPT-labeled_disks
* https://wiki.alpinelinux.org/wiki/Filesystems
* https://wiki.alpinelinux.org/wiki/Alpine_setup_scripts
* https://wiki.alpinelinux.org/wiki/Bootloaders
* https://wiki.alpinelinux.org/wiki/Hosting_services_on_Alpine
+ https://wiki.alpinelinux.org/wiki/Xen_LiveCD
* https://wiki.alpinelinux.org/wiki/Xen_Dom0
* https://wiki.alpinelinux.org/wiki/Xen_Dom0_on_USB_or_SD
