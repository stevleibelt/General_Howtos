# ZFS recover

## Check if a pool is importable by doing a dry run import

```
zpool import -f -F -n <pool name>
```

## Fixing an error

```
#http://zfsonlinux.org/msg/ZFS-8000-8A
zpool status -xv    #run as root
#remove or replace files that are marked as corrupt.
zpool scrub <pool name>
zpool clear <pool name>
#if needed
zpool clear -F <pool name>

#https://zfsonlinux.org/msg/ZFS-8000-9P/
zpool status -xv
#initially, give it a try to clear the error if it is not
#   looking to serious
zpool clear <pool name> <device>
#if thins happen to often, you have to replace the disk
zpool replace <pool name> <faulty device> <new device>
```

## Force importing the pool

```
zpool import -f -F <pool name>
```

## If all is breaking, try to import the pool read only

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

## Links

* [Repairing Damaged Data](https://docs.oracle.com/cd/E19253-01/819-5461/gbbwl/index.html)

