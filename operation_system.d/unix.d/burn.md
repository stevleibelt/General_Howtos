# cli

## wodim

    # install cdrkit
    wodim -v -speed=4 -sao dev=/dev/cdrom image.iso

## [bashburn](http://bashburn.dose.se/)

    ln -s <path to my iso file> /tmp/burn/
    bashburn

## generate checksum

    dd if=/dev/sr0 bs=2048 | md5sum
