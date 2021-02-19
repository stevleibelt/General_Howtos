# dns/nameserver

```
#vim /etc/resolv.conf

domain foo.bar
search foo.bar
nameserver <ip address>
nameserver <an other ip address>
```

# static ip

```
vim /etc/network/interfaces.d/enp0s25

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

# dhcp client configuration

```
#prevent network manager from overwriting the entries in /etc/resolv.conf
echo "supersede domain-name-servers <name server ip one>, <name server ip two>;" >> /etc/dhcp/dhclient.conf
```

# setup proxy

Add and adapt the following lines to `/etc/profile.d/proxy.sh`.

```
#system wide defaults
export http_proxy="http://10.10.1.10:8080/"
export https_proxy="http://10.10.1.10:8080/"
export ftp_proxy="http://10.10.1.10:8080/"
export no_proxy="127.0.0.1,localhost"

#special handling for curl
export HTTP_PROXY="http://10.10.1.10:8080/"
export HTTPS_PROXY="http://10.10.1.10:8080/"
export FTP_PROXY="http://10.10.1.10:8080/"
export NO_PROXY="127.0.0.1,localhost"
```

```
#make it executable
sudo chmod +x /etc/profile.d/proxy.sh
```

```
#check that all is working from your current session
source /etc/profile.d/proxy.sh

env | grep -i proxy
```

## For apt

```
cat >/etc/apt/apt.conf.d/proxyConf<DELIM
Acquire::http
{
    Proxy "http://<username>:<password>@<proxy>:<port>";
}
DELIM
```

If needed, bypass the proxy variables in your calls made with sudo by adding following line to `/etc/sudoers` (Thanks [arch wiki](https://wiki.archlinux.org/index.php/Sudo#Environment_variables)).

```
Defaults env_keep += "ftp_proxy http_proxy https_proxy no_proxy"
```

# links

* [static ips in debian](http://www.techiecorner.com/486/how-to-setup-static-ip-in-debian/)
* [static ip address tutorial](http://www.cyberciti.biz/faq/linux-configure-a-static-ip-address-tutorial/)
* [network configuration](https://wiki.debian.org/NetworkConfiguration)
* [static ip and network configuration on debian linux ](https://www.howtoforge.com/debian-static-ip-address)
* [How To Set System Wide Proxy on Ubuntu 18.04 / Debian 10](https://computingforgeeks.com/how-to-set-system-wide-proxy-on-ubuntu-debian/) - 2019-07-19
