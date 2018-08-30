# how to

```
#check if you device is capable of working as an access point
iw list | grep --color AP
#or
iw list | grep "Supported interface modes" -A 8
#check that the firmware is loaded
dmesg | grep 'firmware\|iwlwifi'
```

```
#install hostapd
#install bridge-utils
vi /etc/hostapd/hostapd.conf
#example file content
interface=wlan0         # the interface used by the AP
hw_mode=g               # g simply means 2.4GHz band
channel=10              # the channel to use
ieee80211d=1            # limit the frequencies used to those allowed in the country
country_code=FR         # the country code
ieee80211n=1            # 802.11n support
wmm_enabled=1           # QoS support

ssid=somename           # the name of the AP
auth_algs=1             # 1=wpa, 2=wep, 3=both
wpa=2                   # WPA2 only
wpa_key_mgmt=WPA-PSK
rsn_pairwise=CCMP
driver=rtl871xdrv       # if you have a Realtek RTL8188CUS device
```

#bring your interface online
ip link set dev wlan0_ap up

#start hostapd
systemctl start hostapd.service

#enable automatic start
systemctl enable hostapd.service
```

## simple solution

Use [create_ap](https://bbs.archlinux.org/viewtopic.php?pid=1269258) (available [here](https://www.archlinux.org/packages/?name=create_ap) or [here](https://aur.archlinux.org/packages/create_ap-git/).

```
create_ap <wifi interface> [<interface with internet>] [<access point name> [<passphrase>]]
create_ap wlan0 internet0 MyAccessPoint MyPassPhrase
```

## if you want use your interface as ap and client

Create two virtual interfaces.

```
iw dev wlan0 interface add wlan0_sta type managed addr 12:34:56:78:ab:cd
iw dev wlan0 interface add wlan0_ap  type managed addr 12:34:56:78:ab:ce
```

# good to know

A software AP is independent from your own network connection (Ethernet, wireless, ...).
You can create random macs with the software macchhanger.

# link

* https://wiki.archlinux.org/index.php/Software_access_point
* https://wiki.archlinux.org/index.php/Network_bridge
* https://wiki.archlinux.org/index.php/Internet_sharing#Configuration
* https://wiki.gentoo.org/wiki/Hostapd
* https://superuser.com/questions/1035755/rtl8188cus-ap-and-client-mode-simultaneously-with-hostapd-in-linux#1036048
* https://developer.ridgerun.com/wiki/index.php?title=Realtek_RTL8188CUS_USB_WiFi_Integration
* https://wiki.archlinux.org/index.php/Wireless_network_configuration
