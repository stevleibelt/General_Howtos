# check smart values (results of last test)

```
#smartctl is in the package smartmontools
smartctl -a /dev/<device>
smartctl -H /dev/<device>
```

# run a test

```
#list what kind of tests is the devices able to do
smartctl -c /dev/<device>

#test that have a high probability of detecting device problems
smartctl -t short /dev/<device>

#short with complete disk surface examination)
smartctl -t long /dev/<device>

#identifies if damage incurred during transportation of the device
smartctl -t conveyance /dev/<device>
```

# get all availabale harddisk parameters

```
hdparm -I /dev/<device> | less
```

# check if ncq (natural command queue) is enabled (>1)

```
cat /sys/block/sdx/device/queue_depth
dmesg | grep -i ncq
smartctl -a -d ata -s on /dev/<device>
```

# links

* https://wiki.archlinux.org/index.php/S.M.A.R.T.
