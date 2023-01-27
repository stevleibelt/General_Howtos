# LSBLK

## Examples

```bash
#fetch a list of devices that are mounted in /media
lsblk -l -o NAME,MOUNTPOINT | grep -i '\/media' | cut -f 1 -d " "
```

## Links

* [lsblk on wiki.ubuntuusers.de](https://wiki.ubuntuusers.de/lsblk/#Spezialfall-o-output-Liste) - 20230126T11:55:40

