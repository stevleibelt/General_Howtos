# How to redirect each http call to https

```
opkg update && opkg install luci-ssl
reboot

#secure luci by only listen to lan
uci set uhttpd.main.listen_http="10.41.2.1:80"
uci set uhttpd.main.listen_https="10.41.2.1:443"

#set redirect
uci set uhttpd.main.redirect_https="1"
uci commit
/etc/init.d/uhttpd restart
```

[source](https://openwrt.org/docs/guide-user/security/secure.access#luci) - 20220219
