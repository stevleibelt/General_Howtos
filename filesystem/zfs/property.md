# increase zpool storage size automatically

ZFS will automatically increase the zpool storage size to the maximum of the smallest disk.
This is usefull if you replace all disks in your current pool with lager ones.

```
zpool set autoexpand=on <pool name>
```

# enable auto snapshot

```
zfs set com.sun:auto-snapshot=true <pool name>
```

# get all available properties

```
zpool get all <pool name>
zfs get all <pool name>
```

# enable access control list (acl)

```
#this is not mandatory, see man zfs
#it will speed up acl but is only available on zfs implementation that support this
zfs set axattr=sa <pool name>
zfs set acltype=posixacl <pool name>
```

# samba share

As a side note, configure your samba directly since this is just a wrapper for samba in zfsonlinux.

```
zfs set sharesmb=on <pool name>
```

# links

* http://blog.allanglesit.com/2011/04/zfs-snapshot-management/
* https://blogs.oracle.com/dougm/entry/smb_vs_zfs
* http://docs.oracle.com/cd/E23824_01/html/821-1448/gayne.html
* http://docs.oracle.com/cd/E19120-01/open.solaris/820-2429/createstaticsmbsharezfstask/index.html
