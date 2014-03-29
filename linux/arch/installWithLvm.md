# Step By Step Howto For Installing Arch Linux With LVM

## Boot And Update

* Boot into ArchLinux ISO
* pacman -Syy
* pacman -S gdisk

## Prepare Disk

* gdisk /dev/sda
    * o   then "y" to confirm
    * n
    * 1
    * <enter>
    * +32M
    * ef02
    * n
    * 2
    * <enter>
    * <enter>
    * 8e00
    * w  then "y"  to confirm

## Create LVM Structure

* pvcreate /dev/sda2
* vgcreate myVolumeGroup00 /dev/sda2
* lvcreate -L 1G -n boot myVolumeGroup00
* lvcreate -C y -L 4G -n swap myVolumeGroup00
* lvcreate -L 10G -n root myVolumeGroup00
* lvcreate -L 10G -n var myVolumeGroup00
* lvcreate -l100%FREE -n home myVolumeGroup00

## Formate Disks

* mkswap /dev/myVolumeGroup00/swap
* mkfs.xfs /dev/myVolumeGroup00/root
* mkfs.xfs /dev/myVolumeGroup00/var
* mkfs.xfs /dev/myVolumeGroup00/home
* mkfs.xfs /dev/myVolumeGroup00/boot

## Mount Disks

* mount /dev/myVolumeGroup00/root /mnt
* cd /mnt
* mkdir home boot
* mount /dev/myVolumeGroup00/boot boot
* mount /dev/myVolumeGroup00/home home
* cd ..

## Installation

* pacstrap /mnt base base-devel
* genfstab /mnt >> /etc/mnt/fstab
* arch-chroot /mnt
* pacman -Syy
* pacman -S grub2-bios
* grub-install –boot-directory=/boot –no-floppy –recheck –debug /dev/sda
* grub-mkconfig -o /boot/grub/grub.cfg
* vi /etc/mkinitcpio.conf
* ADD "lvm2" between sata and filesystems
* HOOKS=". . . lvm2 filesystems . . ."
* run mkinitcpio -p linux
* exit
* umount -a
* reboot

# Links

* http://blog.portnumber53.com/2012/10/30/archlinux-installing-on-gptlvmgrub-2-no-installer/
