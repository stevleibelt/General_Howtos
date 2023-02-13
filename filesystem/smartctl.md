# smartctl

## Check smart values (results of last test)

Smartctl on a disk attached via usb is not fully supported.
Installable via smartmontools.

```bash
#smartctl is in the package smartmontools
## for usb
smartctl -a -d sat /dev/<device>

## for normal devices
smartctl -a /dev/<device>
#view test results
smartctl -H /dev/<device>
#_or
smartctl -a /dev/<device> | grep -i health
```

```bash
#check if smart is supported on your device
smartctl -a /dev/<device>
#enable smartmon
#@see
#   man smartd
#   man smartd.conf
smartctl -s on /dev/<device>
```

## Run a test

### For usb devices

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

### For installed devices

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

## Get all availabale harddisk parameters

```
hdparm -I /dev/<device> | less
```

## Check if ncq (natural command queue) is enabled (>1)

```
cat /sys/block/sdx/device/queue_depth
dmesg | grep -i ncq
smartctl -a -d ata -s on /dev/<device>
```

## Links

* https://wiki.archlinux.org/index.php/S.M.A.R.T.
* [For testing external hdd with smartctl,](https://gist.github.com/meinside/0538087cc60a2f0654bb) - 20201228
* [Understanding SMART Reports](https://wiki.unraid.net/Understanding_SMART_Reports) - 20220717T10:36:40

