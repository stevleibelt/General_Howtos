# installation

```
#install package sshfs
modprobe fuse
```

# mount

```
sshfs user@host:~/foo /home/bar/foo
```

## with compression

```
sshfs user@host:~/foo /home/bar/foo -C
```

## with ssh key

```
sshfs user@host:~/foo /home/bar/foo -o IdentityFile=~/.ssh/id_rsa
```

# unount

```
fusermount -u local/mount/point
```

# help

## debug

```
sshfs -d -f <source> <target>
```

## "read: Connection reset by peer"

* try calling it with -d -f
* if you set the Ciphers option, the chance is high that the server does not support your cipher
```

## “invalid_argument”

```
create local mount point
```

## “???” after mounting

```
check user rights on destination
sshfs -o idmap=user <source> <target>
```

## slow on a mac osx host

```
#[link](https://coderwall.com/p/dwvw_w/sshfs-mac-osx-mount-slow-improve-speed)
sshfs user@host:remote_path local_path -oauto_cache,reconnect,defer_permissions,noappledouble
```

## blazing fast setting

```
sshfs <server://some/folder> </mnt/some_local_folder> -o Ciphers=arcfour -o Compression=no
```

# links

* [mount and unmount sshfs with NetworkManager events](https://odoepner.wordpress.com/2021/12/21/mount-unmount-sshfs-as-network-goes-up-down/) - 20211222
* https://www.digitalocean.com/community/articles/how-to-use-sshfs-to-mount-remote-file-systems-over-ssh
* https://wiki.archlinux.org/index.php/Sshfs
* http://www.smork.info/blog/2013/04/24/entry130424-163842.html
