# TP-Link

## TL-WR841N

### Terminal Upgrade Process

* [wiki page / source](http://wiki.openwrt.org/toh/tp-link/tl-wr741nd)
* scp *-factory.bin root@<ip of your router>:/tmp
* ssh root@<ip of your router>
* cd /tmp
* mv *-factory.bin tplink.bin
* if, and only if firmware contains the word "boot" (should be for original firmware only)
    * dd if=orig.bin of=tplink.bin skip=257 bs=512
* else
    * mtd -r write /tmp/tplink.bin firmware

# links

* http://wiki.openwrt.nanl.de/doc/howto/user.beginner
* http://wiki.openwrt.org/doc/howto/obtain.firmware.download
* http://wiki.openwrt.org/doc/howto/generic.sysupgrade
* http://wiki.openwrt.nanl.de/doc/howto/firstlogin
* http://wiki.openwrt.nanl.de/doc/howto/basic.config
* http://coderazzi.net/howto/openwrt/tl841n/install.htm
