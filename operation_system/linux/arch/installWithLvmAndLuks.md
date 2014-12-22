# partition disk

* pacman -S lvm2 gdisk
* gdisk/cfdisk /dev/sdX
* if you need an [hybrid gpt/mbr](https://wiki.archlinux.org/index.php/GPT#gdisk_basic_.28with_hybrid_MBR.29)

```
# gdisk /dev/sdX
o  # create new empty GUID partition table
n  # partition 1 [enter], from beginning [enter], to 100GiB [+100GiB], linux fs type [enter]
n  # partition 2 [enter], from beginning [enter], to 108GiB [+8GiB],   linux swap    [8200]
n  # partition 3 [enter], from beginning [enter],           [+1MiB],   linux fs type [enter]
r  # recovery/transformation menu
h  # make hybrid mbr
3  # add partition 3 to hybrid mbr
Place EFI GPT (0xEE) partition first in MBR (good for GRUB)? (Y/N): N
Enter an MBR hex code (default 83): [enter]
Set the bootable flag? (Y/N): Y
Unused partition space(s) found. Use one to protect more partitions? (Y/N): N
w  # write table to disk and exit
```

* create new GPT
* create new partition 1 size 4 mb type ef02
* create new partition 2 size 400 mb type 8300
* create new partition 3 size 8e00 (lvm)

# crypt disk

* modprope dm_mod
* modprope dm-crypt
* cryptsetup --cipher aes-xts-plain64|serpent-xts-plain64 --key-size 512 --hash sha512 --iter-time 5000 --use-random --verify-passphrase luksFormat /dev/sdX3 --debug
* cryptsetup open --type luks /dev/sdX3 luks-name

# partition lvm

* pvcreate [--dataalignment 1m] /dev/mapper/luks-name
* vgcreate hostname-vg00 /dev/mapper/luks-name
* lvcreate -L 20G hostname-vg00 -n root
* lvcreate -L 10G hostname-vg00 -n var
* lvcreate -L x0G hostname-vg00 -n home
* optional
    * lvcreate -C y -L xG hostname-vg00 -n swap
    * lvcreate -L x0G hostname-vg00 -n media
    * lvcreate -l +100%FREE hostname-vg00 -n rest #fills up the rest
* lvdisplay
* mkfs.ext4 /dev/mapper/hostname-vg00-root
* optional
    * mkswap /dev/mapper/hostname-vg00-swap
```
    mount /dev/hostname-vg00/root /mnt
    mkdir /mnt/var
    mkdir /mnt/home
    mkdir /mnt/boot
    mount /dev/hostname-vg00/home /home
    mount /dev/hostname-vg00/var /var
```

# create boot

    mkfs.ext4 /dev/sdX2
    mount /dev/sdX2 /mnt/boot

# contiune with normal install

```
    pacstrap /mnt grub-bios base base-devel
    genfstab -p -U /mnt > /mnt/etc/fstab
```
* [configure base system](https://wiki.archlinux.org/index.php/Installation_guide#Configure_the_system)
* adapt "mkinitcpio.conf" and add "keymap encrypt lvm2" before "filesystems" and "shutdown" after
* add 'ext4' to MODULES section
* grub-install --target=i386-pc --recheck --debug /dev/sda
* add to /etc/default/grub

```
    lsblk -f
    blkid (the uuid of the device that contains the luks/lvm, like sdX3)
    GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=/dev/disk/by-uuid/123:hostname-vg00"
    #GRUB_DISABLE_SUBMENU=y
    [ * update-grub ]
    grub-mkconfig -o /boot/grub/grub.cfg
```

# enable trim suppot if you use an ssd

```
    cryptdevice=/dev/mapper/root:root:allow-discards
```

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
* http://vimeo.com/40694871
* http://blog.philippbeck.net/linux/archlinux-install-encryption-lvm-luks-grub2-69
