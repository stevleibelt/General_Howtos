# Debian Linux Network Information

## Set a dns/nameserver

```bash
#vim /etc/resolv.conf

domain foo.bar
search foo.bar
nameserver <ip address>
nameserver <an other ip address>
```

## Set a static ip

```bash
#vim /etc/network/interfaces.d/enp0s25

#loopback
auto lo #auto up on start
iface lo inet loopback

#first interface
auto enp0s25
    iface enp0s25 inet static
        address 192.168.1.118  
        gateway 192.168.1.1
        netmask 255.255.255.0
        network 192.168.1.0
        broadcast 192.168.1.255
```

## Configure a DHCP client

```bash
#prevent network manager from overwriting the entries in /etc/resolv.conf
echo "supersede domain-name-servers <name server ip one>, <name server ip two>;" >> /etc/dhcp/dhclient.conf
```

## Setup Proxy

* Create a [profile proxy](../../proxy.md##define-the-used-variables-everywhere) script

### For APT

```bash
cat >/etc/apt/apt.conf.d/proxyConf<<DELIM
Acquire::http
{
    Proxy "http://<username>:<password>@<proxy>:<port>";
}
DELIM
```

If needed, bypass the proxy variables in your calls made with sudo by adding following line to `/etc/sudoers` (Thanks [arch wiki](https://wiki.archlinux.org/index.php/Sudo#Environment_variables)).

```bash
Defaults env_keep += "ftp_proxy http_proxy https_proxy no_proxy"
```

## Links

* [static ips in debian](http://www.techiecorner.com/486/how-to-setup-static-ip-in-debian/)
* [static ip address tutorial](http://www.cyberciti.biz/faq/linux-configure-a-static-ip-address-tutorial/)
* [network configuration](https://wiki.debian.org/NetworkConfiguration)
* [static ip and network configuration on debian linux ](https://www.howtoforge.com/debian-static-ip-address)
* [How To Set System Wide Proxy on Ubuntu 18.04 / Debian 10](https://computingforgeeks.com/how-to-set-system-wide-proxy-on-ubuntu-debian/) - 2019-07-19

