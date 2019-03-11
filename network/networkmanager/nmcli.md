# nmcli

```
#list available devices and their state

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
```

# link

* [network manager - wiki.archlinux.org.](https://wiki.archlinux.org/index.php/NetworkManager)
