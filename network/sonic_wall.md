# connect to sonicwall howto

## using netextender

```
#install mandatory dependency
sudo pacman -S ppp
sudo chmod u+s /usr/sbin/pppd
#install netextender
## either use aur package or from the webside
#connect to your server
#sudo netExtender --username='<domain>\<user>' --password='<password>' --domain=LocalDomain "<ip address>[:<port>]" --auto-reconnect --dns-prefer-remote
route -n | grep ppp0
#some routes must be there
```

### link

* [netextender official download](https://www.sonicwall.com/en-us/support/knowledge-base/180105195559153)
* [netextender aur](https://aur.archlinux.org/packages/netextender/)
* [support page about ssl vpn](http://help.sonicwall.com/help/sw/eng/published/26.2.0_141009_0947/content/SSL_VPN/SSL_VPN.htm)

## general

* search for "sonicwall linux ipsec" or "sonicwall linux l2tp" (depending on which you want to go with)

## links

* [generic search engine query](https://duckduckgo.com/?q=sonicwall+vpn+client+linux)
* https://superuser.com/questions/141834/connecting-to-a-sonicwall-vpn-from-a-linux-machine
* http://www.linux-faqs.info/vpn/establish-a-vpn-connection-between-sonicwall-and-linux
* https://wiki.archlinux.org/index.php/L2TP/IPsec_VPN_client_setup
* http://www.pelagodesign.com/blog/2009/05/18/ubuntu-linux-how-to-setup-a-vpn-connection-to-a-sonicwall-router-using-openswan-and-pre-shared-keys-psk/
* http://www.linux-faqs.info/vpn/establish-a-vpn-connection-between-sonicwall-and-linux
* http://www.jigsawboys.com/2008/10/23/how-to-configure-ipsec-with-sonicwall/
* http://www.elastichosts.com/support/tutorials/linux-l2tpipsec-vpn-server/
* http://serverfault.com/questions/386000/ipsec-vpn-site-to-site-how-should-i-configure-the-ipsec-conf-files-on-both-site
* http://www.mikealeonetti.com/wiki/index.php?title=Configuring_a_site-to-site_VPN_between_a_Sonicwall_and_Linux_Openswan&oldid=309
* https://www.linuxquestions.org/questions/linux-networking-3/sonicwall-and-linux-vpn-client-334593/
* http://help.mysonicwall.com/applications/vpnclient/
