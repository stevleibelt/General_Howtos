# Logical Volume Manager Terms

* Physical Volume (PV) - Partition on hard disk, hard disk itself or loopback file
* Volume Group (VG) - Group of PV that are used as storage volumne
* Logical Volume (LV) - A virtual/logical partitions
* Physical Extent (PE) - Parts of disks that can assigned to a LV

# Setting Up An LVM

## Prepare Disk

* lsblk tolist available disks
* cfdisk - prepare disk (new bootable partition of type 8E) (cfdisk /dev/sda)
* gdisk -l $disk-device (gdisk -l /dev/sda)

## Create Partition For Booting

* 32 mb in size and of type 8e00

## Create Physical Volume

* pvcreate $disk-device - create physical volume (pvcreate /dev/sda1)
* pvdisplay - shows available physical volumes

## Create Volume Group

* vgcreate $volume-group-name $disk-devide - create volume group
* vgdisplay - shows available  volume groups

## Create Logical Volume

* lvcreate -L 500M $volume-group-name -n lvol-boot - creates boot logical volume
* lvcreate -L $sizeG $volume-group-name -n lvol-swap - create swap logical volume
* lvcreate -L $sizeG $volume-group-name -n lvol-var - create var logical volume
* lvcreate -L $sizeG $volume-group-name -n lvol-root - create root logical volume
* lvcreate -L $sizeG $volume-group-name -n lvol-home - create home logical volume
* lvdisplay

## Create Filesystems

* mkfs.ext4 /dev/mapper/
* mkswap /dev/mapper/$disk-device-lvol-swap


## Add lvm hook to mkinitcpio.conf

* vi /etc/mkinitcpio.conf
* add hoot "lvm2" previous "filesystems"

## Regenerate Ramdisk

* mkinitcpio -p linux

# resize logical volumne

* lvresize -L -8G <volume-group-name/logical-volume-name> (resize minus 8 GB)

# links

* https://wiki.archlinux.org/index.php/Lvm
