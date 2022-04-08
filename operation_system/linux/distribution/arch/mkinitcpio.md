# generate new initramfs

```
# edit file /etc/mkinitcpio.conf
mkinitcpio -p linux
```

# error /proc must be mounted via using chroot?

```
# mount them by hand
mount -t proc proc /proc
mount -t sysfs sys /sys
mount -t devtmpfs udev /dev

# or by adding a basedir
mkinitcpio -b /mnt -p linux
```
