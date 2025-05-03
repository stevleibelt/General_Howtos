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

## Find keyboard device

```bash
# for each file in /dev/input/event*
sudo cat /dev/input/event[1-33]
# second terminal
# typ in something, if you see anything in the cat,
#  you've found your keyboard
```

## Log input

```bash
# log keyboard input
osa -l my_file.log -n /dev/input/eventX
# for clipboard
#  start server
copyq enable
#  list copied stuff
copyq show
```

## Links

* [libinput: archlinux.org](https://wiki.archlinux.org/index.php/Libinput)
* [libinput: mankier](https://www.mankier.com/4/libinput)
* [how to disable the touchpad: askubuntu.com](https://askubuntu.com/questions/65951/how-to-disable-the-touchpad)

