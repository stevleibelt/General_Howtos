# steps

## parition disk

* gdisk /dev/sdX
```
# create new emtpy GUID parition table
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
## zfs pool
n
enter
enter
enter
bf00
## write changes to disk
w
Y
```
## format boot partition 

```
#ext2 is good enough
mkfs.ext2 /dev/sdX2

#but if you want to, ext4 is also working
mkfs.ext4 /dev/sdX2
```

## load needed modules

```
modprobe zfs
```

## setup cryptodisk

* cryptsetup --cipher aes-xts-plain64 --key-size 512 --hash sha512 --iter-time 5000 --use-random --verify-passphrase luksFormat /dev/sdX3 --debug
* cryptsetup luksOpen /dev/sdX3 \<luks pool name\>
* find uuid of the crypto disk
```
# fetch dm-X id
ls -halt /dev/sdX3
# find uuid by seeing softlink endpoint
ls -halt /dev/disk/by-uuid/
# verifiy
lsblk -fs
# or
blkid
```

## create pool

```
#for 512 byte sectors
zpool create <pool name> /dev/mapper/<luks pool name>

#for 4k sectors
zpool create -o ashift=12 <pool name> mirror <first device> <second device>
```

## tune the pool

```
zfs set atime=on <pool name>
zfs set relatime=on <pool name>
zfs set compression=on <pool name>
```

## continue with "Create necessary filesystems" from the official [arch linux wiki](https://wiki.archlinux.org/index.php/Installing_Arch_Linux_on_ZFS)
* when it comes to "Finally, re-import the pool", simple do
```
zpool import -R /mnt <pool name>
#if pool was not exported try
zpool import -fR /mnt <pool name>
```

## continue with "Install and configure Arch Linux" from the official [wiki](https://wiki.archlinux.org/index.php/Installing_Arch_Linux_on_ZFS#Install_and_configure_Arch_Linux)

* do not forget to add the archzfs repository to your pacman.conf like explained [here](http://archzfs.com/)
    * echo "\n[archzfs]\nServer = http://archzfs.com/\$repo/\$arch" >> /etc/pacman.conf
    * echo "Server = http://mirror.sum7.eu/archlinux/archzfs/\$repo/\$arch" >> /etc/pacman.conf
    * echo "Server = https://mirror.biocrafting.net/archlinux/archzfs/\$repo/\$arch" >> /etc/pacman.conf
    * pacman-key -r 5E1ABF240EE7A126
    * pacman-key --lsign-key 5E1ABF240EE7A126
    * pacman -Syy
* if you have a dedicated boot partition, put that into the fstab (beside an optional swap, there is nothing more you need)
* I would not try to put "var" and more to a separate zfs since this leads to some errors while booting up right now (2015-03-03)
* when it comes to the point of adapting the grub.cfg, the "linux" section should look like:

```
linux   /vmlinuz-linux zfs=<zpool name> rw cryptdevice=/dev/disk/by-uuid/<uuid of raw device/parition>:<decrypted device name/identifier> quit
```

# help

## pacstrap -i /mnt \<packages\> /mnt not mounted

* check if your have set the right mount point

```
zfs set mountpoint=/ <pool name>
zfs unmount -a
zfs export
zfs import -R /mnt <pool name>
```

## grub-probe /<zpool name> - error: failed to get canonical path of `/dev/<device string`.

* export ZPOOL_VDEV_NAME_PATH=YES
* retry

## grub-mkconfig -o /boot/grub/grub.cfg - error: failed to get canonical path of \`/dev/\<luks pool name\>\`

* ln -s /dev/mapper/\<luks pool name\> /dev/\<luks pool name\>
* try grub-mkconfig again

## connecting dirmngr at \`/root/.gnupg/S.dirmngr/\` failed: IPC connect call failed

* create directory
```
mkdir -p /root/.gnupg/S.dirmngr
```
* retry

# the 4k sector /advanced format performance issue

* lot of common hard disk drives are listed in the [arch linux wiki](https://wiki.archlinux.org/index.php/Advanced_Format)

## how to determine if the hdd has af/4k sectors?

```
cat /sys/class/block/sdX/queue/physical_block_size
cat /sys/class/block/sdX/queue/logical_block_size

hdparm -I /dev/sdX
```

# links

* [Installing Arch Linux on ZFS](https://wiki.archlinux.org/index.php/Installing_Arch_Linux_on_ZFS) - 2019-02-05
* [Arch Linux on ZFS Root With Separate Boot](https://www.shaunpc.com/arch_zfs_root) - 2016-12-29
* [Arch Linux on an encrypted ZFS root system](https://aaronlauterer.com/blog/2017/04/arch-linux-on-an-encrypted-zfs-root-system/) - 2017-08-18
* https://wiki.archlinux.org/index.php/ZFS#Swap_volume
* http://www.jasonrm.net/articles/2013/10/08/arch-linux-zfs-root/
* https://www.combustible.me/wordpress/2015/10/16/encrypted-zfs-l2arc-and-zil-on-ubuntu-14-04/
