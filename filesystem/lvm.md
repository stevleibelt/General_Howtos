# preparing disk

```
#install gptfdisk
#call gdisk /dev/sda
n
<enter>
<enter>
+32MB
EF02
n
<enter>
<enter>
<enter>
8E00
```

# mounting an lvm

```
#list all your devices
lvmdiskscan
#list available physical volumns
pvdisplay
#list available volumn groups
vgdisplay
#list available logical volumns
lvdisplay

mount /dev/mapper/<your volume group> /mnt
```

## no entries in /dev/mapper/<your volume group>?

```
modprobe dm_mod
vgscan
vgchange -ay
```

# fsck

```
#as en example
fsck.ext4 -yfD /dev/mapper/<your volumne group>
```

# snapshot

* snapshots are create with a fixed size
* if the snapshot runs out of space, the whole snapshot is deleted
* use lvdisplay to check
* a snapshot is a normal lvm volume, you can increase the space each time
* snapshot data is produced via "copy on write" (only if data is changed)

## create

* "-s" or "--snapshot" is the flag to create a snapshot

```
##create an lvm with a size of one gigabyte with the name my_volume_snapshot from my_volume
sudo lvcreate --size 1G -s -n my_volume_snapshot /dev/my_group/my_volume

##mount
sudo mount /dev/my_group/my_volume_snapshot /mnt

##revert to the snapshot and deletes the snapshot
lvconvert --merge /dev/my_group/my_volume_snapshot
```

# links

* https://wiki.archlinux.org/index.php/LVM
* http://tldp.org/HOWTO/LVM-HOWTO/snapshots_backup.html
* http://www.tutonics.com/2012/12/lvm-guide-part-2-snapshots.html
