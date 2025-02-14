# nmcli

```bash
#show general status
nmcli g

#show connection status
nmcli c

#show device status
nmcli d
nmcli device status

#show current dns
nmcli device show | grep -i dns

#reload configuration
nmcli connection reload

#add static ethernet connection
nmcli connection add con-name <string: connection_name> ifname <string: interface name> type ethernet
nmcli connection modify <string: connection_name> ipv4.addresses <ip address>/<network mask>
nmcli connection modify <string: connection_name> ipv4.method manual
nmcli connection modify <string: connection_name> ipv4.gateway <string: ip address>
nmcli connection modify <string: connection_name> ipv4.dns "<string: ip address>[ <string: ip address>]"
nmcli connection up <string: connection_name>

#add a dhcp ethernet connection
nmcli connection add con-name <string: connection_name> ifname <string: interface name> type ethernet
nmcli connection modify <string: connection_name> ipv4.dhcp-timeout 30
nmcli connection modify <string: connection_name> ipv4.may-fail no
nmcli connection up <string: connection_name>

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

## Links

* [Configure an ethernet connection configuration and managing networking](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_and_managing_networking/configuring-an-ethernet-connection_configuring-and-managing-networking) - 20220207
* [network manager - wiki.archlinux.org.](https://wiki.archlinux.org/index.php/NetworkManager)
* [Using nmcli to Import Openvpn Files From the Command Line](https://www.putorius.net/mcli-import-openvpn.html) - 20200510

