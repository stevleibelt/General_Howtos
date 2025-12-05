# Configure monitor settings

## Set options via xorg.conf - disable power management

```bash
# vim /etc/X11/xorg.conf.d/10-monitor.conf
# @see: https://wiki.archlinux.org/index.php/Display_Power_Management_Signaling
Section "ServerLayout"
    Identifier "ServerLayout0"
    Option "StandbyTime" "0"
    Option "SuspendTime" "0"
    Option "OffTime" "0"
EndSection
```

## Get options via xset

```bash
xset q
```

## Set options via xset

```bash
# change blank time to 1 minute
xset s 60 60
# change dpms power saving blank time to 1 minute
xset dpms 60 60 60
# force the screen to turn off
# if you do this in a script, prefix this with >>sleep 1 &&<<
xset dpms force off
# disable dpms
xset s off
xset -dpms
```

## Use turn monitor off when using slock and reset values when turning back on

```
#!/bin/bash
( slock && xset dpms 600 600 600 ) & 
xset dpms 0 0 2 
xset dpms force off 
```

## Links

* https://wiki.archlinux.org/index.php/Display_Power_Management_Signaling
* http://www.computerhope.com/unix/uxset.htm
* https://bbs.archlinux.org/viewtopic.php?id=114993
* https://wiki.archlinux.org/index.php/XScreenSaver#DPMS_and_blanking_settings
