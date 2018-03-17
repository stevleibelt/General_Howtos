# default option

```
xrandr --auto
```

## change resolution of one

```
xrandr --output VGA1 --mode 1024x768
```

## list current modes

```
xrandr --current
#or
xrandr -q
```

## list providers

```
xrandr --listproviders
```

## adjust brightness

```
xrandr --brightness <float>
```

```
Multiply  the  gamma  values on the crtc currently attached to the output to specified floating value.
Useful for overly bright or overly dim outputs.  However, this is a software only modification, if your hardware has support to actually change the brightness, you will probably prefer to use xbacklight.
```

# links

* https://wiki.debian.org/XStrikeForce/HowToRandR12
* https://wiki.archlinux.org/index.php/Multihead#Separate_screens
* http://www.jejik.com/articles/2008/10/setting_up_dual_monitors_system-wide_with_xrandr_on_debian_lenny/
