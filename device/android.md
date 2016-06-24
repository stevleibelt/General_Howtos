# mounting

* if you are using pcmanfm or gnome, "gvfs-mtp" is worth to have a look

```
#fuse based
jmtpfs <path to the mountpoint>
```

# unmounting

```
#assuming you are using jmtpfs
fusermount -u <path to the mountpoint>
```

# links

* https://wiki.archlinux.org/index.php/MTP
