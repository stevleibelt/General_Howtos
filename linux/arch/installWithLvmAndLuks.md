# partition disk

* pacman -S lvm2 gdisk
* gdisk /dev/sdX
* create new partition 1 size 4mb type ef02
* create new partition 2 size 400 mv type 8300
* create new partition 3 size 8e00 (lvm)

# crypt disk

* modprope dm_mod
* cryptsetup --cipher aes-xts-plain64|serpent-xts-plain64 --key-size 512 --hash sha512 --iter-time 5000 --use-random --verify-passphrase luksFormat /dev/sdX3 --debug
* cryptsetup open --type luks /dev/sdX3 lvm-name

# partition lvm

* pvcreate [--dataalignment 1m] /dev/mapper/lvm-name
* vgcreate myVolumeGroup00 /dev/mapper/lvm-name
* lvcreate -L 20G myVolumeGroup00 -n root
* lvcreate -L 10G myVolumeGroup00 -n var
* lvcreate -L x0G myVolumeGroup00 -n home
[ * lvcreate -C y -L xG myVolumeGroup00 -n swap ]
[ * lvcreate -L x0G myVolumeGroup00 -n media ]
[ * lvcreate -l +100%FREE myVolumeGroup00 -n rest ] #fills up the rest
[ * lvdisplay ]
* mkfs.ext4 /dev/mapper/myVolumeGroup00-root
...
[ * mkswap /dev/mapper/myVolumeGroup00-swap ]

mount /dev/myVolumeGroup00/root /mnt
mkdir /mnt/var
mkdir /mnt/home
mkdir /mnt/boot
mount /dev/myVolumeGroup00/home /home
mount /dev/myVolumeGroup00/var /var

# create boot

mkfs -t ext2 /dev/sdX2
mount /dev/sdX2 /mnt/boot

# contiune with normal install
pacmstrap /mnt grub-bios base base-devel
...
* adapt "mkinitcpio.conf" and add "keymap encrypt lvm2" before "filesystems" and "shutdown" after

# enable trim suppot if you use an ssd

cryptdevice=/dev/mapper/root:root:allow-discards

# Links

* https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_Entire_System#LVM_on_LUKS
* https://wiki.archlinux.org/index.php/Dm-crypt_with_LUKS
* https://wiki.archlinux.org/index.php/LVM
* https://wiki.archlinux.org/index.php/Installation_Guide
* https://wiki.archlinux.org/index.php/Dm-crypt/System_Configuration#mkinitcpio
* https://wiki.archlinux.org/index.php/KEYMAP
* https://wiki.archlinux.org/index.php/SSD#TRIM
* https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_Entire_System
* http://suddenkernelpanic.blogspot.de/2013/03/arch-linux-lvm-on-top-of-luks-2013-style.html
