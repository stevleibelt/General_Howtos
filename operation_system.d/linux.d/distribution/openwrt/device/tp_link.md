# TP-Link

## TL-WR841N

### Terminal Upgrade Process

```
scp *-factory.bin root@<ip of your router>:/tmp
ssh root@<ip of your router>
cd /tmp
mv *-factory.bin tplink.bin

#if, and only if firmware contains the word "boot" (should be for original firmware only)
    dd if=orig.bin of=tplink.bin skip=257 bs=512
#else
    mtd -r write /tmp/tplink.bin firmware
```
[wiki page / source](http://wiki.openwrt.org/toh/tp-link/tl-wr741nd)
