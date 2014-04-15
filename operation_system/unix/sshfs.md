# enable fuse

    modprobe fuse

# mount

    sshfs user@host:~/foo /home/bar/foo -C  # -C enable compression

# unount

    fusermount -u locatl/mount/point
