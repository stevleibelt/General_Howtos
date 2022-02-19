# RaspberryPi

We are using a Raspberry Pi 3 Model B, a separate USB-WiFi antenna and openwrt `21.0.1`.

The goal is, that we are connecting the pi to the untrested wifi. Our devices are only connecting to the pi by using its second wifi signal.

# Steps

## Get and "install" openwrt to the disk of the raspberry pi

* [download](https://openwrt.org/toh/raspberry_pi_foundation/raspberry_pi) latest openwrt image
* `cd <to download path>`
* `gunzip openwrt*.gz`
* `dd if=openwrt*.img of=/dev/sdX bs=2M conv=fsync`
* `sync`
* `gzip openwrt*.img` #optional step

## Finish basic installation

Caution, you need to connect a computer to the ethernet port of the openwrt. It is acting as a dhcp server on the `192.168.1.0/24` network.

* `ssh root@192.168.1.1`
* `passwd`
* `system.@system[0].hostname='MyHostName'`
* 
* we need to adjust datetime, this is crucial since all crypto related stuff needs a correct time
* for more information see [openwrt ntp](https://openwrt.org/docs/guide-user/services/ntp/client-server) - 20220218
```
#get current datetime
date

#set real datetime
date -s "yyyy-mm-dd hh:mm:ss"
#set right timezone
system.@system[0].timezone='Europe/Berlin'
#use ntp
ntpd -q -p ptbtime1.ptb.de

```

## Backup configuration files for the SHTF case

* `cd /etc/config`
* `cp firewall firewall.original`
* `cp network network.original`
* `cp wireless wireless.original`

# Setup the two build in interfaces

The ethernet port will be configured with a static ip.

The build in wireless will be configured as dynamic.

We will use the build in wireless to connect to the public wifi.

* `vim network`
    * go to `config interface 'lan'`
    * change ip address in `option ipaddr` to a [reserved ip address](https://en.wikipedia.org/wiki/Reserved_IP_addresses) space like `10.11.12.1`
    * add the line `option force_link '1'` to the end of this configuration block
    * add the following lines (here you can find a [list of dns](../../../network/dns.md)
```
config interface 'wwan'
    option proto 'dhcp'
    option peerdns '0'
    option dns '<first dns> <second dns>'

config interface 'vpnclient'
    option ifname 'tun0'
    option proto 'none'
```
* `vim firewall`
    * change line `option input` from configuration section `config zone\n option name wan` from `REJECT` to `ACCEPT`
* `reboot`
* `ssh@<your previously configurated ip address>`
* `vim /etc/config/wireless`
    * select the option with `radio0`
    * change `channel` value to `11` or `7`
    * change ``hwmode` value to `11g`
    * change ``htmode` value to `HT20`
    * add line `option disabled '0'`
    * add line `option short_gi_40 '0'`
* `uci commit wireless`
* `wifi`

## Join the public wifi

* you can check with a wifi device if wifi `openwrt` is there
* Open `http://<ip address of your openwrt system>` in your webbrowser
* `Network` -> `Wireless`
    * Click on `Scan` on your `Generic ...` device
    * Click on `Join Network` for your local WiFi
        * Check the selectbox `Replace wireless configuration`
        * Enter your passphrase
    * Click on `Save & Apply`

## Update system

* ```echo > upgrade_all.sh <<DELIM
#!/bin/sh
opkg update
opkg list-upgradeable | cut -f 1 -d '' | xargs opkg upgrade
DELIM```
* `chmod +x upgrade_all.sh`
* `./upgrade_all.sh`
* `opkg install kmod-rt2800-lib kmod-rt2800-usb kmod-rt2x00-lib kmod-rt2x00-usb`
* `opkg install openvpn-openssl`
* `opkg install luci-app-openssl`
* `opkg install luci-app-openvpn`
* `sync; sync; reboot`
* `LuCI` -> `VPN` -> `OpenVPN` -> `OVPN configuration file upload`
* Add [kill switch](https://openwrt.org/docs/guide-user/services/vpn/openvpn/extras#kill_switch)

## Setup the USB WiFi

Now you can plugin your raspberry pi

# Want to know more?

* list wireless modes by executing `iw list`
* read the log by running `logead` or `logread -f`

# Links

* [Raspberry Pi - openwrt.org](https://openwrt.org/toh/raspberry_pi_foundation/raspberry_pi) - 20220205
* [OpenWRT on Raspberry Pi 3B/3B+](https://www.aspyct.org/openwrt/raspberry-pi.html) - 20220205
* [my SUPER secure Raspberry Pi Router (wifi VPN travel router) - youtube](https://www.youtube.com/watch?v=jlHWnKVpygw) - 20220205
* [How To Install openwrt on Raspberry Pi](https://github.com/mikenizo808/How-To-Install-openwrt-on-Raspberry-Pi) - 20220128
