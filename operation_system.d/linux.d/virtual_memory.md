# Investivate and free system memory by using  `/proc/sys/vm/drop_caches`

## Howto

```bash
# List memory status
free -m

# Free memory
# As this is a non-destructive operation, and dirty objects are not freeable,
#   the user should run "sync" first in order to make sure all cached objects are freed.
# In a daily basis, the kernel does this for you.
# This method results into a degregation of system perfomance since all caches need to
#   be rebuild.
# This may be useful after applying security changes or before performance tests.

# Free page cache
sync; echo 1 > /proc/sys/vm/drop_caches

# Free dentries and inodes
sync; echo 2 > /proc/sys/vm/drop_caches

# Free pagecache, dentries and inodes
sync; echo 3 > /proc/sys/vm/drop_caches
```

## Links

* https://wiki.archlinux.org/index.php/Maximizing_performance
* http://www.linuxinsight.com/proc_sys_vm_drop_caches.html
* https://wiki.archlinux.org/index.php/Benchmarking/Data_storage_devices#Using_dd
