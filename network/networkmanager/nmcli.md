# nmcli

```
#reload configuration
nmcli connection reload

#list available wireless lans
nmcli device wifi list

#turn of wifi
nmcli radio wifi off

#connect to a visible wireless lan
nmcli device wifi connect <ssid> password "<password>"

#connect to a visible wireless lan by defining the wireless network interface
nmcli device wifi connect <ssid> password "<password>" ifname <interface>

#connect to a hidden wireless lan
nmcli device wifi connect <ssid> password "<password>" hidden yes

#disconnect an interface
nmcli connection down <connection> [ifname <interface>]

#reconnect an interface
nmcli connection up <connection> [ifname <interface>]

#import one openvpn connection
nmcli connection import type openvpn file foo.ovpn 

#import a lot openvpn connections
for ITERATOR in $(ls *.ovpn); do nmcli connection import type openvpn file ${ITERATOR}; done
```

# link

* [network manager - wiki.archlinux.org.](https://wiki.archlinux.org/index.php/NetworkManager)
* [Using nmcli to Import Openvpn Files From the Command Line](https://www.putorius.net/mcli-import-openvpn.html) - 2020-05-10
