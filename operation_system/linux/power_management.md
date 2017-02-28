# list of power states

* freeze - suspend to idle
* standby - power on suspend
* mem - suspend to ram
* disk - suspend to disk

# how does suspend to disk work work under linux?

Linux is dumping the whole memoy into your swap file or swap partition.
On the reboot, the kernel is searching for a "suspend-to-disk" image and loads them.

# suspend to ram or disk

## fetch supported power states

```
#all listed modes are the on your system support
cat /sys/power/state
```

## suspend to your favorit mode

```
echo <mode> > /sys/power/state
```

## suspend to disk

First of all, your swap has to have at least the size of your memory.

```
#raw method
echo /dev/<identifier of your swap partition> > /sys/power/resume
####
#with grub
#edit: /etc/default/grub
#add something like the following: GRUB_CMDLINE_LINUX_DEFAULT="resume=/dev/sdc2"
#and rebuild your grub config with: grub2-mkconfig -o /boot/grub/grub.cfg
```

# change the way how your pc reacts on acpi events (like pushing a button)

Edit the file /etc/acpi/handler.sh (e.g. unmounting network drives etc.).

# links

* [suspend to disk/ram with linux.](http://karellen.blogspot.de/2013/07/suspend-to-diskram-with-linux.html)
* [power management interface for system sleep](https://www.mjmwired.net/kernel/Documentation/power/interface.txt)
* [suspend and hbernate](https://wiki.gentoo.org/wiki/Suspend_and_hibernate)
* [power management](https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate)
* [grub and hibernation](https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate#Hibernation)
* [sleep hooks](https://wiki.archlinux.org/index.php/Power_management#Sleep_hooks)
* [power states](https://www.kernel.org/doc/Documentation/power/states.txt)
