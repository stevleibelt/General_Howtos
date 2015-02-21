# verifiy device

```
dmidecode -t system | grep Version
```

# acpi

```
/proc/acpi/ibm
```

# disable (keyboard / pc speaker) beep

```
####
# @see
# https://wiki.archlinux.org/index.php/Disable_PC_Speaker_Beep
####

#per session
rmmod pcspkr

#general
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
´´´

# links

* http://www.thinkwiki.org/wiki/How_to_configure_the_TrackPoint
* http://www.thinkwiki.org/wiki/Thinkpad-acpi
* http://julianhanke.de/wiki/index.php?title=ThinkPad_S1_Yoga_Ubuntu
* http://www.linlap.com/lenovo_thinkpad_yoga
