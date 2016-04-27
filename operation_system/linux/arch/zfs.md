# add to /etc/pacman.conf

```
[demz-repo-core]
SigLevel = Required
Server = http://demizerone.com/$repo/$arch

#or

[archzfs]
Server = http://archzfs.com/$repo/x86_64
```

# on shell

```
#@see: https://wiki.archlinux.org/index.php/Pacman/Package_signing#Adding_unofficial_keys
#add the repository key
pacman-key -r <key id>
#verify fingerprint
pacman-key -f <key id>
#locally sign and import key
pacman-key --lsign-key <key id>

#install software
pacman -Syy archzfs
```

# links

* https://github.com/demizer/archzfs
* https://wiki.archlinux.org/index.php/ZFS
* https://wiki.archlinux.org/index.php/Unofficial_user_repositories#archzfs
