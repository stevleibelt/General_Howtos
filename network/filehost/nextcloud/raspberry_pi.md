# alpine linux

## steps

* fdisk /dev/<path to the sd card>
* create two partitions
* first with a size of 512 mb (which is way to much for alpine but we a prepared for anything that comes)
* first paritition type is c (W95 FAT32)
* first partition flags are LBA and bootbale
* second partition is the rest
* mkfs.vfat -F 32 /dev/<path to the sd card>1
* mkfs.ext4 /dev/<path to the sd card>2

### example fdisk output from a 4 GB card

```
Disk /dev/mmcblk0: 3.7 GiB, 3965190144 bytes, 7744512 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x03073934

Device         Boot   Start     End Sectors  Size Id Type
/dev/mmcblk0p1 *       2048 1050623 1048576  512M  c W95 FAT32 (LBA)
/dev/mmcblk0p2      1050624 7743487 6692864  3.2G 83 Linux

Command (m for help):
```
