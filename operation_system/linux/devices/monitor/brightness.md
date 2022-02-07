# Path

* "/sys/class/backlight/<device>/brightness"

# Usage / Tools

```
# set maximum
xbacklight -set 100

# set minimum
xbacklight -set 0

# decrease
xbacklight -dec 10

# increase
xbacklight -inc 10

# create configuration
sensors-detect

# see available opitons
sensors -u
```

# Solve Errors

## No outputs have backlight property

Add following option in your `/etc/X11/xorg.conf.d/20-intel.conf` `Section Device`.

```
Option      "Backlight"  "intel_backlight"
```

# Link

* [backlight utilities](https://wiki.archlinux.org/title/Backlight#Backlight_utilities)
* [lm sensors](https://wiki.archlinux.org/index.php/Lm_sensors)
* [xbacklight](https://wiki.archlinux.org/index.php/Backlight#xbacklight)
    * [xsensors](https://www.archlinux.org/packages/?name=xsensors)
