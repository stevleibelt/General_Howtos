#Check If A Pool Is Importable

zpool import -f -F -n $tank

#If Possible, Import It
zpool import -f -F $tank

zpool import -o readonly=on $tank

zdb -C $tank
zdb -d $tank
zdb -e $tank
zdb -l /dev/disk/by-id/$device

zpool import -f $tank
zpool import -Fn $tank

zpool clear -F $tank
zpool detach $tank $device
