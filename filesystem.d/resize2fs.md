# Resize2fs (resizefs for grep search since I am lazy and forget the 2)

This is only working for ext2/3/4 filesytems.

By default, you should grow a filesystem but not shrink it. Shrinking is possible but dangerous.

## Prozedure

```
#umount device
umount /dev/<device>

#check filesystem
e2fsck /dev/<device>

#resize
#if no size is given, the partition will be grown to the maximum
resize2fs /dev/<device> [size]

#mount device
```

