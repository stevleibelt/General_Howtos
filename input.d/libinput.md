# Libinput

This can be use

## Output the devices on the system and their respective supported features

```bash
libinput list-devices
# or
xinput --list
```

## Get option per device

```bash
# Fetch <string: device_number>
# xinput --list | grep -i pad
xinput list-props <device number>
```

## Set option per device

```bash
#create a .conf file for a general solution
xinput set-prop <device number> <option number> <setting>
```

## Disable or enable input

```bash
xinput --enable <id>
xinput --disable <id>
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

* [libinput: archlinux.org](https://wiki.archlinux.org/index.php/Libinput)
* [libinput: mankier](https://www.mankier.com/4/libinput)
* [how to disable the touchpad: askubuntu.com](https://askubuntu.com/questions/65951/how-to-disable-the-touchpad)

