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

# upgrade bios

```
#links
#   https://wiki.archlinux.org/index.php/Remastering_the_Install_ISO
#   https://wiki.archlinux.org/index.php/Flashing_BIOS_from_Linux
#   https://workaround.org/article/updating-the-bios-on-lenovo-laptops-from-linux-using-a-usb-flash-stick/
#download latest iso from http://support.lenovo.com/de/en/products/Laptops-and-netbooks/ThinkPad-X-Series-laptops/ThinkPad-X250/downloads/DS102289
#install genisoimage or cdrkit or geteltorito (where genisoimage is part of)
geteltorito -o bios.img <file name>.iso
dd if=bios.img of=/dev/<your device> bs=1M

```

# links

* https://wiki.archlinux.org/index.php/Intel_graphics
* https://en.wikipedia.org/wiki/List_of_Intel_Core_i7_microprocessors
* http://www.thinkwiki.org/wiki/How_to_configure_the_TrackPoint
* http://www.thinkwiki.org/wiki/Thinkpad-acpi
* https://support.lenovo.com/de/en/documents/pd100610
* http://support.lenovo.com/de/en/products/Laptops-and-netbooks/ThinkPad-X-Series-laptops/ThinkPad-X250?query=&Shallow=1&Type=&OperatingSystems=&Component=&Symptom=&tabName=Downloads&linkTrack=Mast:SubNav:Support:Drivers%20and%20Software|Drivers%20and%20Software&beta=false
