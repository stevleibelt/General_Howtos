# basics

## calibrate

* runs several powerstates for several devices to find the optimal settings for battery mode
* do not touch the system while calibrating

    powertop --calibrate

## auto tune

* sets all values to "good"
* "good" is good for battery mode but you will lose some power when you are in ac mode

    powertop --auto-tune

## general options

* --help
* --quiet

# links

* https://wiki.archlinux.org/index.php/Powertop
* https://01.org/powertop/
* http://www.acpi.info/
* https://wiki.archlinux.org/index.php/Power_saving
