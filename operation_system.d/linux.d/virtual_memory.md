# free some memory

As this is a non-destructive operation, and dirty objects are not freeable, the user should run "sync" first in order to make sure all cached objects are freed.

## list memory status

```
free -m
```

## free page cache

```
echo 1 > /proc/sys/vm/drop_caches
```

# free dentries and inodes

```
echo 2 > /proc/sys/vm/drop_caches
```

# free pagecache, dentries and inodes

```
echo 3 > /proc/sys/vm/drop_caches
```

# links

* https://wiki.archlinux.org/index.php/Maximizing_performance
* http://www.linuxinsight.com/proc_sys_vm_drop_caches.html
* https://wiki.archlinux.org/index.php/Benchmarking/Data_storage_devices#Using_dd
