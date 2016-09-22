# migrate from ext3 to ext4

```
#example is based on the fact that you are migrating "/"
#adapt /etc/fstab and replace ext3 with ext4
#switch to single user mode (init 1 on system v machines)
mount -o remount,ro /
fsck.ext3 -pf /dev/sdX1
#reboot
#switch to single user mode (init 1 on system v machines)
tune2fs -O extents,uninit_bg,dir_index /dev/sdX1
mount -o remount,ro /
fsck.ext4 -yfD /dev/sdX1
#reboot
```

# repair ext 4

```
fsck.ext4 -yfD /dev/<device>
```

# defragment ext 4

```
#available to e2fsprogs
e4defrag -c <device>
```
