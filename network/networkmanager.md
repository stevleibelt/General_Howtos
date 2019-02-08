# switch from netctl to networkmanager

```
#install networkmanager
pacman -S networkmanager

#find all netctl enabled services
find /etc/systemd | grep -i netctl

#disable them with
systemctl disable <service name>

#disable all netctl services also via netcl
# to be on the save side
netctl disable <service>

#enable and start network manager service
systemctl enable NetworkManager.service 
systemctl start NetworkManager.service 
```

# links

* [arch linux wiki - NetworkManager](https://wiki.archlinux.org/index.php/NetworkManager)
* [arch linux wiki - Wireless network configuration](https://wiki.archlinux.org/index.php/Wireless_network_configuration)
* [arch linux wiki - Network configuration](https://wiki.archlinux.org/index.php/Network_configuration)
* [How to Configure and Manage Network Connections Using nmcli Tool](https://www.tecmint.com/configure-network-connections-using-nmcli-tool-in-linux/) - 2016-03-03
