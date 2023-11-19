# show current harddrive layout

```
#general overview
/sbin/fdisk -l

#show general information
parted /dev/<sda> print devices

#show information per device
parted /dev/<sda> print
```

# list disks and partitions

```
lsblk
```

# delete disk content and layout

```
shred -v /dev/<sda>
```

# setup a disk

```
#create gpt label
parted /dev/<sda> mklabel gpt

#create partition
#parted /dev/<sda> --align opt mkpart <string: filesystem> <string: start point [1]> <string: end point [100%]>
##e.g. create two partisions equal in size
parted /dev/<sda> --align opt mkpart xfs 1 50%
parted /dev/<sda> --align opt mkpart ext4 51% 100%

#name partition on
parted /dev/<sda> name 1 <string: my name>
```

# links

* [Partition a drive on Linux with GNU Parted](https://opensource.com/article/21/4/linux-parted-cheat-sheet) - 20210401
