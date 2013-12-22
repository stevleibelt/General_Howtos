# Step By Step Howto For Installing Arch Linux With LVM

## Boot And Update

* Boot into ArchLinux ISO
* modprobe dm-mod
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
* vgcreate arch /dev/sda2
* lvcreate -L 1G -n boot arch
* lvcreate -C y -L 4G -n swap arch
* lvcreate -L 10G -n root arch
* lvcreate -L 10G -n var arch
* lvcreate -l100%FREE -n home arch

## Formate Disks

* mkswap /dev/arch/swap
* mkfs.xfs /dev/arch/root
* mkfs.xfs /dev/arch/var
* mkfs.xfs /dev/arch/home
* mkfs.xfs /dev/arch/boot

## Mount Disks

* mount /dev/arch/root /mnt
* cd /mnt
* mkdir home boot
* mount /dev/arch/boot boot
* mount /dev/arch/home home
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
