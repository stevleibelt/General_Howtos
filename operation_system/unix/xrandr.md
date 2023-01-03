# Xrandr

## Just use auto mode

```bash
xrandr --auto
#for debugging reasons use
xrandr --auto --verbose
```

## Change resolution of one

```bash
xrandr --output VGA1 --mode 1024x768 [--rate 60]
```

## List current modes

```bash
xrandr --current
#or
xrandr -q
```

## List providers

```bash
xrandr --listproviders
```

## Adjust brightness

```bash
xrandr --brightness <float>
```

```bash
Multiply  the  gamma  values on the crtc currently attached to the output to specified floating value.
Useful for overly bright or overly dim outputs.  However, this is a software only modification, if your hardware has support to actually change the brightness, you will probably prefer to use xbacklight.
```

## Links

* https://wiki.debian.org/XStrikeForce/HowToRandR12
* https://wiki.archlinux.org/index.php/Multihead#Separate_screens
* http://www.jejik.com/articles/2008/10/setting_up_dual_monitors_system-wide_with_xrandr_on_debian_lenny/

