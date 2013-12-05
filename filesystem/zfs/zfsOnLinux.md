depmod -a
modprobe zfs

# failed to load zfs module
## check whats currently running

dmks status

## if not spl and zfs is installed, do the following steps with fitting version numbers

dkms remove -m zfs -v 0.6.0.90 --all
dkms remove -m spl -v 0.6.0.90 --all
dkms add -m spl -v 0.6.0.90
dkms add -m zfs -v 0.6.0.90
dkms install -m spl -v 0.6.0.90
dkms install -m zfs -v 0.6.0.90
