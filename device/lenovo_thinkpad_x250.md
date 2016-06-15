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

# hardware information

# i7-5600U

* Broadwell
* HD 5500

# links

* https://wiki.archlinux.org/index.php/Intel_graphics
* https://en.wikipedia.org/wiki/List_of_Intel_Core_i7_microprocessors
* http://www.thinkwiki.org/wiki/How_to_configure_the_TrackPoint
* http://www.thinkwiki.org/wiki/Thinkpad-acpi
