# steps to setup an openwrt router as repeater (works on a TP-LINK TL-WA901ND)

Unfinished!

```
#update packages
opkg update
opkg list-upgradable
#if needed
#opkg upgrade

#install and enable relayd
opkg install relayd
opkg install luci-proto-relay
/etc/init.d/relayd enable

#configure
cd /etc/config
cp network network.[yyyy-mm-dd]
cp wireless wireless.[yyyy-mm-dd]
```

* [dhcp to another router](https://forum.openwrt.org/viewtopic.php?id=69171)
* [wifi repeater in the same subnet](https://forum.openwrt.org/viewtopic.php?id=68610)
* [configure openwrt as client bridge with a repater](https://www.youtube.com/watch?v=8v2NyY2sK_M)
* [how to set as a wifi-range extender](https://forum.openwrt.org/viewtopic.php?id=63766)
* [range extender](https://forum.openwrt.org/viewtopic.php?id=61056)
* [how to bridge interfaces with router still accessable](https://forum.openwrt.org/viewtopic.php?id=59836)
* [is it working](https://forum.openwrt.org/viewtopic.php?id=58800)
* [selecting a router as range extender](https://forum.openwrt.org/viewtopic.php?id=51970)
* [configure wifiextender](https://forum.openwrt.org/viewtopic.php?id=51767)
* [connecting as repeater](https://forum.openwrt.org/viewtopic.php?id=50167)


# link

* [relayclient](https://wiki.openwrt.org/doc/recipes/relayclient)
* [openwrt as repeater](http://behindthesciences.com/useful-links/Installing-OpenWrt-as-Wireless-Repeater)
* [with relayd](http://trac.gateworks.com/wiki/OpenWrt/wireless/relayd)
* [relay and openwrt](http://trac.gateworks.com/wiki/OpenWrt/wireless/relayd)
* [connecting 2 routers](https://forum.openwrt.org/viewtopic.php?id=69023)
* [wds repeater guide](https://wiki.openwrt.org/doc/recipes/atheroswds?s[]=wireless)
* [pseudobridge guide](https://wiki.openwrt.org/doc/recipes/relayclient)
* [wireless faq at openwrt](https://wiki.openwrt.org/doc/faq/faq.wireless)
* [wireless overview](https://wiki.openwrt.org/doc/howto/wireless.overview)
* [wireless and uci](https://wiki.openwrt.org/doc/uci/wireless)
* [wireless repeater in the forum](https://forum.openwrt.org/viewtopic.php?id=39077)
