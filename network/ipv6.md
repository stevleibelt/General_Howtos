# disable ipv6 

```
sudo vim /etc/default/grub
#add "ipv6.disable=1" at the end of "GRUB_CMDLINE_LINUX_DEFAULT"
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

# links

* [IPv6 definition](https://de.wikipedia.org/wiki/IPv6)
* [Disable IPv6](https://askubuntu.com/questions/440302/how-to-disable-ipv6-when-connecting-to-an-openvpn-server-using-network-manager-o#441122)
