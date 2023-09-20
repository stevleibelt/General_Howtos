# Libinput

## Output the devices on the system and their respective supported features

```bash
libinput list-devices
#same
xinput
```

## Get option per device

```bash
xinput list-props <device number>
```

## Set option per device

```bash
#create a .conf file for a general solution
xinput set-prop <device number> <option number> <setting>
```

## Disable or enable input

```bash
xinput enable <id>
xinput disable <id>
```

## Disable "natural scrolling"

```bash
#sudo vim /etc/X11/xorg.conf.d/30-touchpad.conf
Section "InputClass"
        Identifier "MyTouchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        #@see https://www.mankier.com/4/libinput
        Option "NaturalScrolling" "off"
EndSection
```

## Links

* https://wiki.archlinux.org/index.php/Libinput
* https://www.mankier.com/4/libinput
* https://askubuntu.com/questions/65951/how-to-disable-the-touchpad

