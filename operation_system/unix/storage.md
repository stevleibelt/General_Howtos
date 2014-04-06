# check smart values

smartctl -A /dev/sda

# get all availabale harddisk parameters

hdparm -I /dev/sda | less

# check if ncq (natural command queue) is enabled (>1)

cat /sys/block/sdx/device/queue_depth
dmesg | grep -i ncq
smartctl -a -d ata -s on /dev/sda
