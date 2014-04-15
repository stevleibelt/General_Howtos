# enable fuse

    modprobe fuse

# mount

    sshfs user@host:~/foo /home/bar/foo

## with compression

    sshfs user@host:~/foo /home/bar/foo -C

## with ssh key

    sshfs user@host:~/foo /home/bar/foo -o IdentityFile=~/.ssh/id_rsa

# unount

    fusermount -u locatl/mount/point
