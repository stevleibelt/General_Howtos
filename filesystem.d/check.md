# Check filesystem

You can check hdd or even an usb stick/pen with that.

```
#non-destructive read-write test
badblocks -nsv /dev/sd[a-z]

#you can also check the filesystem with badblocks ooption
#   this is a read-write test
fsck -vccl /dev/sd[a-z][1-9]

#this will destroy any previously stored data
sudo badblocks -w -s -o error.log /dev/sd[a-z]
```

# Links

* [badblocks - wiki.archlinux.org](https://wiki.archlinux.org/title/Badblocks) - 20210603
