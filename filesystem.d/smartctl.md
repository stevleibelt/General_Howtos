# smartctl

## Check smart values (results of last test)

Smartctl on a disk attached via usb is not fully supported.
Installable via smartmontools.

```bash
#smartctl is in the package smartmontools
## for usb
smartctl -a -d sat /dev/<string: device>
## for nvme
smartctl -d nvme /dev/<string: device>

## for normal devices
smartctl -a /dev/<string: device>
#view test results
smartctl -H /dev/<string: device>
#_or
smartctl -a /dev/<string: device> | grep -i health
```

```bash
#check if smart is supported on your device
smartctl -a /dev/<string: device>
#enable smartmon
#@see
#   man smartd
#   man smartd.conf
smartctl -s on /dev/<string: device>
```

## Run a test

### For usb devices

```bash
#short test
smartctl -t short -d sat /dev/<string: device>
smartctl -l selftest -d sat /dev/<string: device>

#long test
##start
smartctl -t long -d sat /dev/<string: device> -T permissive

##check result
smartctl -l selftest -d sat /dev/<string: device> -T permissive
```

### For nvme devices

```bash
#short test
smartctl -t short -d nvme /dev/<string: device>

#long test
##start
smartctl -t long -d nvme /dev/<string: device> -T permissive

##check result
smartctl -l selftest -d nvme /dev/<string: device> -T permissive
```

### For installed devices

```bash
#list what kind of tests is the devices able to do
smartctl -c /dev/<string: device>

#test that have a high probability of detecting device problems
smartctl -t short /dev/<string: device>
#check current status
smartctl -a /dev/<string: device> | grep -i short

#short with complete disk surface examination)
smartctl -t long /dev/<string: device>
#check current status
smartctl -a /dev/<string: device> | grep -i extended

#identifies if damage incurred during transportation of the device
smartctl -t conveyance /dev/<string: device>
#check current status
smartctl -a /dev/<string: device> | grep -i conveyance
```

## Get all availabale harddisk parameters

```bash
hdparm -I /dev/<string: device> | less
```

## Check if ncq (natural command queue) is enabled (>1)

```bash
cat /sys/block/sdx/string: device/queue_depth
dmesg | grep -i ncq
smartctl -a -d ata -s on /dev/<string: device>
```

## Links

* https://wiki.archlinux.org/index.php/S.M.A.R.T.
* [For testing external hdd with smartctl,](https://gist.github.com/meinside/0538087cc60a2f0654bb) - 20201228
* [Understanding SMART Reports](https://wiki.unraid.net/Understanding_SMART_Reports) - 20220717T10:36:40

