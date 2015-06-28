# load zfs kernel module 

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

# error handling

## Cannot add dependency job for unit zfs.service

### use zfs.target instead

    #see https://aur.archlinux.org/packages/zfs-git/?comments=all
    systemctl disable zfs.service
    systemctl enable zfs.target

### missing hostid

    #see https://bbs.archlinux.org/viewtopic.php?id=170003
    hostid > /etc/hostid
    mkinitcpio -p linux

### zfs-import-cache.service: Main process exited, code=exited, status=1/FAILURE


    echo "#!/bin/bash\n#https://bbs.archlinux.org/viewtopic.php?id=183851\nfor i in {1..10}; do\n  [[ -e /dev/zfs ]] && exit 0\n  sleep 1\ndone\n[[ -e /dev/zfs ]]" > /etc/zfs/waitforzfsdevice
    chmod +x /etc/zfs/waitforzfsdevice
    mkdir -p /etc/systemd/system/zfs-import-cache.service.d
    echo "[Service]\nExecStartPre=/etc/zfs/waitforzfsdevice" > /etc/systemd/system/zfs-import-cache.service.d/waitforzfsdevice.conf

