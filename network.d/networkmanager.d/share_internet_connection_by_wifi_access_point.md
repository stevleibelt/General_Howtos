# Share a (ethernet) internet connection through a wifi-adapter as access point

## Mandatory preconditions

* Connected wired network
* Existing wireless adapter (if you are doing it via usb, you have to put in the usb-ethernet-adapter)

## HowTo

```bash
nmcli connection add type wifi ifname <string: wifi_device> con-name <string: connection_name> autoconnect yes ssid <string: ssid>
nmcli connection modify <string: connection_name> 802-11-wireless.mode
nmcli connection modify <string: connection_name> 802-11-wireless.band bg
nmcli connection modify <string: connection_name> 802-11-wireless.channel <int: channel|1>
nmcli connection modify <string: connection_name> wifi-sec.key-mgmt wpa-psk
nmcli connection modify <string: connection_name> wifi-sec.proto rsn
nmcli connection modify <string: connection_name> wifi-sec.group ccmp 
nmcli connection modify <string: connection_name> wifi-sec.pairwise ccmp
nmcli connection modify <string: connection_name> wifi-sec.psk "<string: password with [0-9][a-zA-Z] and special characters"
nmcli connection modify <string: connection_name> ipv4.method shared
#bo: enable 5 GHz
nmcli connection modify <string: connection_name> 802-11-wireless.band a
nmcli connection modify <string: connection_name> 802-11-wireless.channel 35
#eo: enable 5 GHz
nmcli connection up <string: connection_name>
```

## Links

* [Create a Wi-Fi hotspot on Linux using nmcli](https://gist.github.com/narate/d3f001c97e1c981a59f94cd76f041140) - 20230216
* [Turn Linux Computer into Wi-Fi Access Point (Hotspot)](https://woshub.com/create-wi-fi-access-point-hotspot-linux/) - 20230415

