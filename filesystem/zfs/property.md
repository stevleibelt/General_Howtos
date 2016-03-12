# increase zpool storage size automatically

ZFS will automatically increase the zpool storage size to the maximum of the smallest disk.
This is usefull if you replace all disks in your current pool with lager ones.


```
zpool set autoexpand=on <pool>
```
