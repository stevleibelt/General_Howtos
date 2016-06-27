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

# disable "natural scrolling"

```
#sudo vim /etc/X11/xorg.conf.d/30-touchpad.conf
Section "InputClass"
        Identifier "MyTouchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        #@see https://www.mankier.com/4/libinput
        Option "NaturalScrolling" "off"
EndSection
```

# links

* https://wiki.archlinux.org/index.php/Libinput
* https://www.mankier.com/4/libinput
