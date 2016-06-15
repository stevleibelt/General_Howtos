# output the devices on the system and their respective supported features

```
libinput-list-devices
#same
xinput
```

# get option per device

```
xinput list-props <device number>
```

# set option per device

```
#create a .conf file for a general solution
xinput set-prop <device number> <option number> <setting>
```

# links

* https://wiki.archlinux.org/index.php/Libinput
