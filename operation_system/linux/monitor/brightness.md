# tools

* [xbacklight](https://wiki.archlinux.org/index.php/Backlight#xbacklight)
* [lm_sensors](https://wiki.archlinux.org/index.php/Lm_sensors)
    * [xsensors](https://www.archlinux.org/packages/?name=xsensors)

# [xbacklight](https://wiki.archlinux.org/index.php/Backlight#xbacklight)

## set maximum

    xbacklight -set 100

## set minimum

    xbacklight -set 0

## decrease

    xbacklight -dec 10

## increase

    xbacklight -inc 10

# [lm sensors](https://wiki.archlinux.org/index.php/Lm_sensors)

## create configuration

    sensors-detect

## see available opitons

    sensors -u
