#steps

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
mkfs.ext4 /dev/sdX2
```

## load needed modules

```
modprobe zfs
```

## setup cryptodisk

* cryptsetup --cipher aes-xts-plain64 --key-size 512 --hash sha512 --iter-time 5000 --use-random --verify-passphrase luksFormat /dev/sdX3 --debug
* cryptsetup luksOpen luks /dev/sdX3 <luks pool name>
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
zpool create <pool name> /dev/mapper/<luks pool name>
```

## Continue with "Create necessary filesystems" from the official [arch linux wiki](https://wiki.archlinux.org/index.php/Installing_Arch_Linux_on_ZFS#Create_necessary_filesystems)
* when it comes to "Finally, re-import the pool", simple do
```
zpool import -R /mnt <pool name>
```
* when it comes to the point of adapting the grub.cfg, the "linux" section should look like:
```
linux   /vmlinuz-linux zfs=<zpool name> rw cryptdevice=/dev/disk/by-uuid/<uuid of raw device/parition>:<decrypted device name/identifier> quit
```

# help

## pacstrap -i /mnt <packages> /mnt not mounted

* check if your have set the right mount point

```
zfs set mountpoint=/ <pool name>
zfs unmount -a
zfs export
zfs import -R /mnt <pool name>
```

## grub-mkconfig -o /boot/grub/grub.cfg - failed to get canonical path of `/dev/<luks pool name>`

* ln -s /dev/mapper/<luks pool name> /dev/<luks pool name>
* try grub-mkconfig again

# links

* https://wiki.archlinux.org/index.php/Installing_Arch_Linux_on_ZFS
* https://wiki.archlinux.org/index.php/ZFS#Swap_volume
* http://www.jasonrm.net/articles/2013/10/08/arch-linux-zfs-root/
