# steps

* wifi-menu #connect to the internet
* pacman-key -r F75D9D76
* pacman-key --lsign-key F75D9D76
* loadkeys /usr/share/kbd/keymaps/i386/qwertz/de.map.gz
* timedatectl set-ntp true
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
* modprobe zfs
* zpool create \<pool name> /dev/sdX3
* zpool set mountpoint=/ \<pool name>
* zpool import -R /mnt \<pool name>
* mkdir /mnt/boot
* mount /dev/sdX2 /mnt/boot
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
* pacman -S vim bash-completion nmon htop grub
* useradd -m -g users -G wheel -s /bin/bash \<user name>
* passwd \<user name>
* visudo # comment out %wheel
* modprobe zfs
* grub-install --target=i386-pc /dev/sdX
* vim /etc/default/grub # add >>zfs=\<pool name> rw << before >>quiet<<
* grub-mkconfig -o /boot/grub/grub.cfg
* vim /etc/mkinitcpio.conf #add >>zfs<< before the >>filesystem<<
* mkinitcpio -p linux
* passwd
* gdisk /dev/sdX
* x
* a
* 1
* 2
* enter
* w
* Y

# links

* [arch linux installation guide](https://wiki.archlinux.org/index.php/Installation_guide)
* [arch linux zfs](https://wiki.archlinux.org/index.php/ZFS)
* [arch linux grub](https://wiki.archlinux.org/index.php/GRUB)
* [arch zfs](https://github.com/archzfs/archzfs/wiki)
