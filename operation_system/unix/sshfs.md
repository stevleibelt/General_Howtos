# enable fuse

    modprobe fuse

# mount

    sshfs user@host:~/foo /home/bar/foo

## with compression

    sshfs user@host:~/foo /home/bar/foo -C

## with ssh key

    sshfs user@host:~/foo /home/bar/foo -o IdentityFile=~/.ssh/id_rsa

# unount

    fusermount -u local/mount/point

# help

## debug

    sshfs -d -f <source> <target>

## “invalid_argument”

    create local mount point

## “???” after mounting

    check user rights on destination

## slow on a mac osx host

    #[link](https://coderwall.com/p/dwvw_w/sshfs-mac-osx-mount-slow-improve-speed)
    sshfs user@host:remote_path local_path -oauto_cache,reconnect,defer_permissions,noappledouble

# links

* https://www.digitalocean.com/community/articles/how-to-use-sshfs-to-mount-remote-file-systems-over-ssh
* https://wiki.archlinux.org/index.php/Sshfs
