# check if a pool is importable by doing a dry run import

```
zpool import -f -F -n <pool name>
```

# fixing an error

```
zpool scrub <pool name>
zpool clear <pool name>
```

# force importing the pool

```
zpool import -f -F <pool name>
```

# if all is breaking, try to import the pool read only

```
zpool import -o readonly=on <pool name>
# doing some magic
zdb -C <pool name>
zdb -d <pool name>
zdb -e <pool name>
zdb -l /dev/disk/by-id/$device

zpool import -f <pool name>
zpool import -Fn <pool name>

zpool clear -F <pool name>
zpool detach <pool name> <path to the device>
```
