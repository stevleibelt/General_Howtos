# keyboard

```
loadkeys i368/qwertz/de-latin1-nodeadkeys.map.gz
```

# parition disk

* gdisk /dev/sdX
```
## create new emtpy GUID parition table
o
Y
# create partitions
## bios boot partiton

n
enter
enter
4M
ef02

## boot partition

n
enter
enter
512M
8300

## root
n
enter
enter
enter
8300

## write changes to disk
w
Y
```

# format partitions

```
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3
```

# mount

```
mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda2 /mnt/boot
```

# update system time

```
timedatectl set-timezone Europe/Berlin
```

# install base

```
pacstrap /mnt base
```

# configuration

```
genfstab -p -U /mnt >> /mnt/etc/fstab
arch-root /mnt
echo hostname > /etc/hostname
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
#adapt /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
echo KEYMAP=de > /etc/vconsole.conf
echo FONT=lat9w-16 >> /etc/vconsole.conf
mkinitcpio -p linux
passwd
pacman -S grub sudo
grub-install --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
exit
umount /mnt/boot
umount /mnt
reboot
```
