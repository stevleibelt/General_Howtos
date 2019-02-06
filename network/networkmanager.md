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
