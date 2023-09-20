# Captive portals

* Public wifi access points are often protected by a captive portal
  * Captive portal is a webpage where you have to enter an access code or something equal
  * Usually they are managed by the access point's dns server
* By default, OpenWrt has a security feature that prevents client to connect to this pages
  * The security feature is called `dns rebinding attach`
* You have to disable this feature to be able to connect to this captive portals
* From the GUI
  * `Network` -> `DHCP and DNS`
* [From the commandline](https://openwrt.org/docs/guide-user/network/wifi/ap_sta#disable_dns_rebind_protection)

```bash
#disable dns rebind protection
uci set dhcp.@dnsmasq[0].rebind_protection="0"
uci commit dhcp
/etc/init.d/dnsmasq restart
```

