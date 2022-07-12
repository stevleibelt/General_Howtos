# commands

```
#get information about basic board
ubus call system board

#package manager
opkg

#read logs
logread

#system
/etc/config/system

#wireless settings
/etc/config/wireless
/etc/config/network

#list available wireless devices
##phy0 will be wlan0
iw list

#scan for wireless networks
iw wlan0 scan
#or
ifconfig wlan0 down
iw phy phy0 interface add scan0 type station
ifconfig scan0 up
iwlist scan0 scan
iw dev scan0 del
ifconfig wlan0 up
killall -HUP hostapd

#reset wifi
wifi down && sleep 5 && wifi
```

# minimal interface configuration

```
#/etc/config/network
config 'interface' 'wan'
    option 'protp' 'dhcp'
    option 'ifname' 'eth0.1'
```

# install gui

```
opkg install luci-ssl
/etc/init.d/uhttpd restart
```

# links

* [beginner](http://wiki.openwrt.nanl.de/doc/howto/user.beginner)
    * [uci base system](https://openwrt.org/docs/guide-user/base-system/uci) - 20220218
* [how to openwrt](http://wireless.subsignal.org/index.php?title=Howto_OpenWRT)
* [list of howtos](https://wiki.openwrt.org/doc/howto/start)
* [list of recipes](https://wiki.openwrt.org/doc/recipes/index)
* [firmware download](http://wiki.openwrt.org/doc/howto/obtain.firmware.download)
* [system upgrade](http://wiki.openwrt.org/doc/howto/generic.sysupgrade)
* [first login](http://wiki.openwrt.nanl.de/doc/howto/firstlogin)
* [basic configuration](http://wiki.openwrt.nanl.de/doc/howto/basic.config)
* [wireless overview](http://wiki.openwrt.nanl.de/doc/howto/wireless.overview)
* [wireless faq](https://wiki.openwrt.org/doc/faq/faq.wireless)
* [log](http://wiki.openwrt.org/doc/howto/log.essentials)
* [packages](https://github.com/openwrt/packages)
* [network overview](http://wiki.openwrt.org/doc/uci/network)
    * [users](http://wiki.openwrt.org/doc/uci/users)
    * [netfilter](http://wiki.openwrt.org/doc/howto/netfilter
* [firewall](http://wiki.openwrt.org/doc/uci/firewall)
* [dhcp configuration](https://openwrt.org/docs/guide-user/base-system/dhcp_configuration) - 20220712T12:05:10
* [ddns](http://wiki.openwrt.org/doc/howto/ddns.client)
* [ssh / dropbear](http://wiki.openwrt.org/doc/uci/dropbear)
* [secure](http://wiki.openwrt.org/doc/howto/secure.access)
    * [luci](http://wiki.openwrt.org/doc/howto/luci.secure)
* [install on a WR841N](http://coderazzi.net/howto/openwrt/tl841n/install.htm)
    * [setup a WR841N](http://wiki.openwrt.org/toh/tp-link/tl-wr841nd)
* [recipes](http://wiki.openwrt.nanl.de/doc/recipes/start)
    * [route access point](http://wiki.openwrt.nanl.de/doc/recipes/routedap)
    * [routed client](http://wiki.openwrt.nanl.de/doc/recipes/routedclient)
    * [relay client](http://wiki.openwrt.nanl.de/doc/recipes/relayclient)
* [use a log server](https://kuther.net/blog/analyzing-openwrt-firewall-logs-splunk)
* [station mode](http://linuxwireless.org/en/users/Documentation/modes/)
* [openvpn client](https://openwrt.org/docs/guide-user/services/vpn/openvpn/client-luci) - 20220218
