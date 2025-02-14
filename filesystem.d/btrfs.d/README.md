# BTRFS

## General information

```bash
# check status for mountpoint /
sudo btrfs filesystem show /

# check statistics and errors for mountpoint /
sudo btrfs device stats /

# show usage for mountpoint /
sudo btrfs filesystem usage /

# check filesystem capacity for mountpoint /
sudo btrfs filesystem df stats /

# start balance status for mountpoint /
sudo btrfs balance start /

# show balance status for mountpoint /
sudo btrfs balance status [-v] /

# show usage and raid level of data and meta for mountpoint /
sudo btrfs filesystem usage /

# change raid levels for mountpoint /
# accepted raid levels are raid0, raid1 and raid10
# raid0: striping
# raid1: mirroring
sudo btrfs balance start -dconvert=[raid level] -mconver=[raid level] /

# Start defragmentation for mountpoint /
sudo btrfs defragment -r /

# Start scrubbing for mountpoint /
sudo btrfs scrub start /

# List scrubbing status for mountpoint /
sudo btrfs scrub status /

# Add a device to mountpoint /
sudo btrfs device add -f /dev/[sdx] /

# Remove a device from mountpoint /
sudo btrfs device delete /dev/[sdx] /

# Remove a missing device from mountpoint /
sudo mount -o degraded /dev/[sdx] /
```

## Handle subvolumes

```bash
# list subvolume
sudo btrfs subvolume list

# create subvolume
sudo btrfs subvolume create

# delete subvolume
sudo btrfs subvolume delete

# create snapshot
sudo btrfs snapshot

```

## Create btrfs with a cached device using lvm

This example is for the usecase to create a RAID 1 but can be used for a single HDD too.
If you just have one hdd, simple skip all tasks where a `2` or a `sdb` is in the command.

It assumed that you have one cache device and two hdds in the following device list:

* 1 ssd is /dev/nvme1n1 with a size of 238G
* 1 hdd is /dev/sda with a size of 931G
* 1 hdd is /dev/sdb with a size of 931G

```bash
# ref: https://www.dont-panic.cc/capi/2022/11/22/speeding-up-btrfs-raid1-with-lvm-cache/
# ref: https://wiki.archlinux.org/title/LVM
# ref: https://wiki.archlinux.org/title/Btrfs
# ref: https://blog.delouw.ch/2020/01/29/using-lvm-cache-for-storage-tiering/

# wipe data to prevent issues
sudo wipefs --all --backup /dev/sda
sudo wipefs --all --backup /dev/sdb
sudo wipefs --all --backup /dev/nvme1n1

# prepare cache device
#   we are creating two partitions, one for each hdd
sudo gdisk /dev/nvme1n1
o
Y
n
1
<enter>
+115G
8e00
n
2
<enter>
+115G
8e00
w
Y

# create pv's
sudo pvcreate /dev/sda
sudo pvcreate /dev/sdb
sudo pvcreate /dev/nvme1n1
## check if pvs where created
sudo pvs

# create vg
sudo vgcreate vg0 /dev/sda /dev/sdb /dev/nvme1n1
## check if vg was created
sudo vgs

# create lv
#   just 900G to ease up optional use cases later one
sudo lvcreate -n data-btrfs1 -L 900G vg0 /dev/sda
sudo lvcreate -n data-btrfs2 -L 900G vg0 /dev/sdb
sudo vgextend vg0 /dev/nvme1n1p1
sudo vgextend vg0 /dev/nvme1n1p2
sudo lvcreate --type cache --cachemode writethrough -l 100%FREE -n cache-btrfs1 vg0/data-btrfs1 /dev/nvme1n1p1
sudo lvcreate --type cache --cachemode writethrough -l 100%FREE -n cache-btrfs2 vg0/data-btrfs2 /dev/nvme1n1p2

# create btrfs
sudo mkfs.btrfs -m raid1 -d raid1 /dev/vg0/data-btrfs1 /dev/vg0/data-btrfs2
sudo btrfs device scan

# find uuid
sudo btrfs filesystem show
# add a line like the following to your /etc/fstab
# UUID=<string: uuid of btrfs file system show> /data   btrfs   defaults,noatime,compress=zstd 0 0

# mount it and create subvolume
sudo mount /dev/vg0/data-btrfs1 /data
sudo btrfs subvolume create /data/mysubvolume

# check cache hits
sudo lvs -a -o +devices,cache_total_blocks,cache_used_blocks,cache_dirty_blocks,cache_read_hits,cache_read_misses,cache_write_hits,cache_write_misses,segtype

# remove dead cache
sudo vgreduce vg0 –removemissing
```
