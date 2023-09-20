# ZFS cache

## Add log (ZIL)

```
zpool add <pool name> log <device name>
```

## Add cache (l2arc)

```
zpool add <pool name> cache <device name>
```

## Remove log (ZIL) or cache (l2arc)

```
zpool remove <pool name> <device name>
```

## Links

* http://www.unixarena.com/2013/07/zfs-zpool-cache-and-log-devices.html
* http://www.zfsbuild.com/2010/06/03/howto-add-cache-drives-to-a-zpool/ 
* https://prestongarrison.com/adding-zil-log-and-l2arc-cache-to-freebsd-zfs-using-ssds/
* https://www.combustible.me/wordpress/2015/10/16/encrypted-zfs-l2arc-and-zil-on-ubuntu-14-04/

