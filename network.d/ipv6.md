# Disable ipv6 

## Temporarily

```bash
#disable is "1", enable is "0"
#use "all" for "<interface identifier>" if you want to disable it globally
sudo sh -c 'echo 1 > /proc/sys/net/ipv6/conf/<interface identifier>/disable_ipv6'
```


## Permanently with sysctl.d

```bash
sudo vim /etc/sysctl.d/40-disable-ipv6.conf
#add following lines
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
#maybe keep loopback device to not run into docker container issues?
net.ipv6.conf.lo.disable_ipv6 = 1
#if you want to only disable for a dedicated device
#net.ipv6.conf.<device name>.disable_ipv6 = 1
```

## Permanently with grub

```bash
sudo vim /etc/default/grub
#add "ipv6.disable=1" at the end of "GRUB_CMDLINE_LINUX_DEFAULT"
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

# Links

* [Disable IPv6](https://askubuntu.com/questions/440302/how-to-disable-ipv6-when-connecting-to-an-openvpn-server-using-network-manager-o#441122)
* [Disable IPv6](http://ask.xmodulo.com/disable-ipv6-linux.html)
* [How I disabled IPv6 on Linux](https://opensource.com/article/22/8/disable-ipv6) - 20220802
* [IPv6 definition](https://de.wikipedia.org/wiki/IPv6)
