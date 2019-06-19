# steps

## general 

* [create an arch iso and put it on an usb stick with zfs inside](https://github.com/stevleibelt/arch-linux-live-cd-iso-with-zfs)
* wifi-menu #connect to the internet
* pacman-key -r F75D9D76
* pacman-key --lsign-key F75D9D76
* loadkeys /usr/share/kbd/keymaps/i386/qwertz/de.map.gz
* timedatectl set-ntp true
* modprobe zfs
* if bios
    * gdisk /dev/sdX
    * o
    * Y
    * n
    * enter
    * enter
    * 4M
    * ef02
    * n
    * enter
    * enter
    * 512M
    * 8300
    + n
    * enter
    * enter
    * enter
    * bf00
    * w
    * Y
    * mkfs.ext2 /dev/sdX2
    * zpool create \<pool name> /dev/sdX3
* if uefi
    * check if uefi exists
        * ls /sys/firmware/efi
        * efivar --list
    * check device is good (on the example sdX)
        * dmesg | grep sdX
        * lsblk
        * cat /proc/partitions
    * gdisk /dev/sdX
        * 0
        * Y
        * n
        * enter
        * enter
        * 512MB
        * ef00
        * n
        * enter
        * enter
        * enter
        * bf00
        * w
        * Y
    * verify all is fine
        * gdisk -l /dev/sdX
    * mkfs.vfat /dev/sdX1
    * zpool create \<pool name> /dev/sdX2
* zfs set mountpoint=/ \<pool name>
* zpool import -R /mnt \<pool name>
* mkdir /mnt/boot
* if bios
    * mount /dev/sdX2 /mnt/boot
* if uefi
    * mount /dev/sdX1 /mnt/boot
* pacstrap /mnt base base-devel
* genfstab -U /mnt >> /mnt/etc/fstab
* arch-chroot /mnt
* ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
* hwclock --systohc
* echo "KEYMAP=de-latin1" > /etc/vconsole.conf
* vim /etc/locale.gen #comment out your locale
* locale-gen
* echo "LANG=en_US.UTF-8" > /etc/locale.conf
* echo "\<hostname>" > /etc/hostname
* echo "127.0.1.1 \<hostname>.localdomain \<hostname>" >> /etc/hosts
* echo "" >> /etc/pacman.conf
* echo "[archzfs]" >> /etc/pacman.conf
* echo "Server = http://archzfs.com/$repo/x86_64" >> /etc/pacman.conf
* pacman-key -r F75D9D76
* pacman-key --lsign-key F75D9D76
* pacman -S archzfs-linux #or >>archzfs-linux-lts<< if needed
* pacman -S vim bash-completion nmon htop grub git sudo
* useradd -m -g users -G wheel -s /bin/bash \<user name>
* passwd \<user name>
* visudo # comment out %wheel
* modprobe zfs
* if bios
    * grub-install --target=i386-pc /dev/sdX
    * if you are running pure zfs
        * vim /etc/default/grub #add >>zfs=\<pool name> rw << before >>quiet<<
    * else if you are running luks plus zfs
        * ls -l /dev/disk/by-uuid | grep sdX >> /etc/default/grub
        * vim /etc/default/grub #add >>zfs=\<pool name> rw cryptdevice=/dev/disk/by-uuid/\<your device uuid>:\<your crypto device name><< before >>quiet<<
    * grub-mkconfig -o /boot/grub/grub.cfg
    * vim /boot/grub/grub.cfg #verify each line starting with >>zfs=<<, remove the part of >>root=ZFS=...<< and make sure there is only one >>rw<<
* if uefi
    * bootctl install
    * ls -l /boot #check all is fine
    * mkdir -p boot/loader
    * cd boot/loader
    * vim loader.conf #@see: https://wiki.archlinux.org/index.php/Systemd-boot
        * default   arch
        * timeout   4
        * console-mode  max
        * editor    no
    * vim entries/arch.conf
        * title Arch Linux
        * linux /vmlinuz-linux
        * initrd /initramfs-linux.img
        * options zfs=\<pool name> rw cryptdevice=/dev/disk/by-uuid/\<your device uuid>:\<your crypto device name>
    * create automatic update pacman hook #@see: https://wiki.archlinux.org/index.php/Systemd-boot#Automatic_update
    * bootctl list #verify all is working
* if you are running pure zfs
    * vim /etc/mkinitcpio.conf #add >>zfs<< before the >>filesystem<<
* else if you are running luks plus zfs
    * vim /etc/mkinitcpio.conf #add >>encrypt zfs<< before the >>filesystem<<
* vim /etc/mkinitcpio.conf #move keyboard before zfs and add keymap
* mkinitcpio -p linux
* passwd #change the password of root
* gdisk /dev/sdX    #mark boot parition as bootable
    * x
    * a
    * 1
    * 2
    * enter
    * w
    * Y
* exit
* zpool set cachefile=/etc/zfs/zpool.cache \<pool name>
* systemctl enable zfs.target
* systemctl start zfs.target
* systemctl enable zfs-import-cache
* systemctl enable zfs-mount
* systemctl enable zfs-import.target
* umount /mnt/boot
* zfs umount -a
* zpool export \<pool name>

# misc

## console font

* install: terminus-font
* list fonts: pacman -Sl terminus-font
* set font: setfont ter-v32n

# links

* [create you own bootable arch iso usb stick with zfs inside](https://github.com/stevleibelt/arch-linux-live-cd-iso-with-zfs)
* [arch linux installation guide](https://wiki.archlinux.org/index.php/Installation_guide)
* [arch linux zfs](https://wiki.archlinux.org/index.php/ZFS)
* [arch linux grub](https://wiki.archlinux.org/index.php/GRUB)
* [arch zfs](https://github.com/archzfs/archzfs/wiki)
* [Archlinux install in less than 10 minutes on a UEFI system](https://www.youtube.com/watch?v=DfC5hgdtbWY) - 2017-02-04
* [arch linux on zfs - part 2](https://ramsdenj.com/2016/06/23/arch-linux-on-zfs-part-2-installation.html) - 2016-06-23
