# Network general readme

## dig

```bash
#list final ip address
dig +noall +answer bazzline.net
```

## host


```bash
#list ip address and mail/mx information
host bazzline.net
```

## arp

```bash
arp
#or with ips
arp -n
```

## net stat

```bash
#if you don't have netstat anymore, ss is a drop in replacement
netstat -i
```

## retriev network device

```bash
lspci | grep -i net
```

## config lan

```bash
#deprecated on arch linux, use ip or nmcli/nmtui
ifconfig
```

## config wlan

```bash
#deprecated on arch linux, use ip or nmcli/nmtui
iwconfig
```

## bring interface up

```bash
#or nmcli connection up <network_configuration>
ip link set wlan0 up
```

## show status of current ling

```bash
iwlist wlan0 rate
```

## get used firmeware

```bash
dmesg | grep firmware
```

## scan for nearby ESSID

```bash
nmcli device wifi list
#or
iwlist wlan0 scan
```

## use netctl

do not put your wifi in an "up" stage (ip link set wlan0 down), otherwise, no connection possible.

## connect with wpa

### backup current wpa file

```bash
mv /etc/wpa_supplicant.conf /etc/wpa_supplicatn.conf.original
```

### passphrase

```bash
wpa_passphrase linksys "my_super_secret_passkey" > /etc/wpa_supplicant.conf
```

## cli networkmanager

### starting services

```bash
start /etc/rc.d/dbus start and /etc/rc.d/networkmanager start
```

### show available connections

```bash
nmcli connection list
```

### up con

```bash
nmcli connection up id $NAME
```

## use dhcp

```bash
dhcpcd wlan0
```

## test connection

```bash
ping -c 3 www.google.de
```

## measure network connection speed

```bash
#on server:
iperf -s -B <server ip address>

#on client:
iperf -c <server ip address> -d -t 60 -i 10
```

## resource record

### CNAME

Is a CanonicalName or alias that is linking to the real name.

Common is to have a CNAME for "bazzline.net" which is linking to "www.bazzline.net".

## Links

* [A free open-source network computer cloning and management solution](https://fogproject.org/) - 2020-02-20
* [Network configuration](https://wiki.archlinux.org/index.php/Network_configuration)
  * [systemd-networkd](https://wiki.archlinux.org/index.php/Systemd-networkd)
* https://de.wikipedia.org/wiki/Kategorie:Resource_Record
* https://en.wikipedia.org/wiki/CNAME_record
* [uberspace.de](https://www.uberspace.de/) - 20201108
  * [uberspace 7 manual](https://manual.uberspace.de/en/index.html) - 20201108
  * [uberlab](https://lab.uberspace.de/index.html) - 20201108

