# disable ipv6 

## temporarily

```
#disable is "1", enable is "0"
#use "all" for "<interface identifier>" if you want to disable it globally
sudo sh -c 'echo 1 > /proc/sys/net/ipv6/conf/<interface identifier>/disable_ipv6'
```

## permanently with sysctl.d

```
sudo vim /etc/sysctl.d/40-disable-ipv6.con
#add following lines
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
net.ipv6.conf.<device name>.disable_ipv6 = 1
```

## permanently with grub

```
sudo vim /etc/default/grub
#add "ipv6.disable=1" at the end of "GRUB_CMDLINE_LINUX_DEFAULT"
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

# links

* [IPv6 definition](https://de.wikipedia.org/wiki/IPv6)
* [Disable IPv6](https://askubuntu.com/questions/440302/how-to-disable-ipv6-when-connecting-to-an-openvpn-server-using-network-manager-o#441122)
* [Disable IPv6](http://ask.xmodulo.com/disable-ipv6-linux.html)
