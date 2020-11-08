# dig

```
#list final ip address
dig +noall +answer bazzline.net
```

# host


```
#list ip address and mail/mx information
host bazzline.net
```

# arp

```
arp
#or with ips
arp -n
```

# net stat

```
netstat -i
```

# retriev network device

```
lspci | grep -i net
```

# config lan

```
#deprecated on arch linux, use ip
ifconfig
```

# config wlan

```
#deprecated on arch linux, use ip
iwconfig
```

# bring interface up

```
ip link set wlan0 up
```

# show status of current ling

```
iwlist wlan0 rate
```

# get used firmeware

```
dmesg | grep firmware
```

# scan for nearby ESSID

```
iwlist wlan0 scan
```

# use netctl

do not put your wifi in an "up" stage (ip link set wlan0 down), otherwise, no connection possible.

# connect with wpa

## backup current wpa file

```
mv /etc/wpa_supplicant.conf /etc/wpa_supplicatn.conf.original
```

## passphrase

```
wpa_passphrase linksys "my_super_secret_passkey" > /etc/wpa_supplicant.conf
```

# cli networkmanager

## starting services

```
start /etc/rc.d/dbus start and /etc/rc.d/networkmanager start
```

## show available connections

```
nmcli con list
```

## up con

```
nmcli con up id $NAME
```

# use dhcp

```
dhcpcd wlan0
```

# test connection

```
ping -c 3 www.google.de
```

# measure network connection speed

```
#on server:
iperf -s -B <server ip address>

#on client:
iperf -c <server ip address> -d -t 60 -i 10
```

# resource record

## CNAME

Is a CanonicalName or alias that is linking to the real name.

Common is to have a CNAME for "bazzline.net" which is linking to "www.bazzline.net".

# links

* [A free open-source network computer cloning and management solution](https://fogproject.org/) - 2020-02-20
* [Network configuration](https://wiki.archlinux.org/index.php/Network_configuration)
    * [systemd-networkd](https://wiki.archlinux.org/index.php/Systemd-networkd)
* https://de.wikipedia.org/wiki/Kategorie:Resource_Record
* https://en.wikipedia.org/wiki/CNAME_record
* [uberspace.de](https://www.uberspace.de/) - 20201108
    * [uberspace 7 manual](https://manual.uberspace.de/en/index.html) - 20201108
    * [uberlab](https://lab.uberspace.de/index.html) - 20201108
