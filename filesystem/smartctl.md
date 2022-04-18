# check smart values (results of last test)

Smartctl on a disk attached via usb is not fully supported.
Installable via smartmontools.

```
#smartctl is in the package smartmontools
## for usb
smartctl -a -d sat /dev/<device>

## for normal devices
smartctl -a /dev/<device>
#view test results
smartctl -H /dev/<device>
```

```
#check if smart is supported on your device
smartctl -a /dev/<device>
#enable smartmon
#@see
#   man smartd
#   man smartd.conf
smartctl -s on /dev/<device>
```

# run a test

## for usb devices

```
#short test
smartctl -t short -d sat /dev/<device>
smartctl -l selftest -d sat /dev/<device>

#long test
##start
smartctl -t long -d sat /dev/<device> -T permissive

##check result
smartctl -l selftest -d sat /dev/<device> -T permissive
```

## for installed devices

```
#list what kind of tests is the devices able to do
smartctl -c /dev/<device>

#test that have a high probability of detecting device problems
smartctl -t short /dev/<device>
#check current status
smartctl -a /dev/<device> | grep -i short

#short with complete disk surface examination)
smartctl -t long /dev/<device>
#check current status
smartctl -a /dev/<device> | grep -i extended

#identifies if damage incurred during transportation of the device
smartctl -t conveyance /dev/<device>
#check current status
smartctl -a /dev/<device> | grep -i conveyance
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
* [for testing external hdd with smartctl,](https://gist.github.com/meinside/0538087cc60a2f0654bb) - 20201228
