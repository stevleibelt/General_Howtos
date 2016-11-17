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

# links

* https://wiki.archlinux.org/index.php/LVM
