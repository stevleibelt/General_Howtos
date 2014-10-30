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

* [beginner](http://wiki.openwrt.nanl.de/doc/howto/user.beginner)
* [firmware download](http://wiki.openwrt.org/doc/howto/obtain.firmware.download)
* [system upgrade](http://wiki.openwrt.org/doc/howto/generic.sysupgrade)
* [first login](http://wiki.openwrt.nanl.de/doc/howto/firstlogin)
* [basic configuration](http://wiki.openwrt.nanl.de/doc/howto/basic.config)
* [wireless overview](http://wiki.openwrt.nanl.de/doc/howto/wireless.overview)
* [network overview](http://wiki.openwrt.org/doc/uci/network)
* [ddns](http://wiki.openwrt.org/doc/howto/ddns.client)
* [install on a WR841N](http://coderazzi.net/howto/openwrt/tl841n/install.htm)
    * [setup a WR841N](http://wiki.openwrt.org/toh/tp-link/tl-wr841nd)
* [recipes](http://wiki.openwrt.nanl.de/doc/recipes/start)
    * [route access point](http://wiki.openwrt.nanl.de/doc/recipes/routedap)
    * [routed client](http://wiki.openwrt.nanl.de/doc/recipes/routedclient)
    * [relay client](http://wiki.openwrt.nanl.de/doc/recipes/relayclient)
