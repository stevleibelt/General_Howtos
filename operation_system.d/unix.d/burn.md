# Burn things under uni

## Via CLI

```bash
# For cd
cdrecord -v -sao dev=/dev/sr0 isoimage.iso

# For dvd and bd
growisofs -dvd-compat -Z /dev/sr0=isoimage.iso

# For cd, dvd and bd
xorriso -as cdrecord -v -sao dev=/dev/sr0 isoimage.iso

# install cdrkit
wodim -v -speed=4 -sao dev=/dev/cdrom image.iso

# bashburn
# ref: http://bashburn.dose.se/

ln -s <path to my iso file> /tmp/burn/
bashburn

## generate checksum
dd if=/dev/sr0 bs=2048 | md5sum
```

## Links

* [burning: archlinux.org](https://wiki.archlinux.org/title/Optical_disc_drive#Burning) - 20260627
