# Linux power management

## General Information

```bash
# list possible available power management tools
ps aux | egrep 'logind|gsd-power|powerdevil|xfce4-power-manager|upowerd|acpid|xfce4-power|mate-power|gnome-power-manager'

# search for fitting event in the journal since this boot
sudo journalctl -b | grep -i 'lid\|acpi\|suspend\|sleep'
# my personal preference
sudo journalctl -b | grep -i 'lid\||suspend\|sleep' | grep -v 'autorandr\|invalid'
```

Information about [acpid](acpid.md) is available.  
Information about [systemd-logind](systemd.d/logind.md) is available.  
Information about [upower](upower.md) is available.  

## How is a suspend mode triggered and which parts are used

* You have a acpi event list located in `/etc/acpi/handler.sh`
  * This file is used from `/etc/acpi/events/anything`
* Depending on the acpi events, there is a high chance that [systemd-logind](systemd.d/logind.md) is called
  * You can configure `logind` via `/etc/systemd/logind.conf`

### Check if acpi event for lid closed has has reached logind

* Close your lid
* Type in `sudo journalctl -b | grep -i 'lid\|suspend'`
* Expected lines are
  * `[...] Lid closed.`
  * `[...] Suspending [...]`

## List of power states

* freeze - suspend to idle
* standby - power on suspend
* mem - suspend to ram
* disk - suspend to disk

## How does suspend to disk work work under linux?

Linux is dumping the whole memory into your swap file or swap partition.
On the reboot, the kernel is searching for a "suspend-to-disk" image and loads them.

## Manually suspend to ram or disk

### Fetch supported power states

```bash
#all listed modes are the on your system support
cat /sys/power/state
```

### Suspend to your favorit mode

```bash
echo <mode> > /sys/power/state
```

### Suspend to disk

First of all, your swap has to have at least the size of your memory.

```bash
#raw method
echo /dev/<identifier of your swap partition> > /sys/power/resume
####
#with grub
#edit: /etc/default/grub
#add something like the following: GRUB_CMDLINE_LINUX_DEFAULT="resume=/dev/sdc2"
#and rebuild your grub config with: grub2-mkconfig -o /boot/grub/grub.cfg
```

## Change the way how your pc reacts on acpi events (like pushing a button)

Edit the file /etc/acpi/handler.sh (e.g. unmounting network drives etc.).

## Links

* [Grub and hibernation](https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate#Hibernation)
* [Power management interface for system sleep](https://www.mjmwired.net/kernel/Documentation/power/interface.txt)
* [Power management with systemd](https://wiki.archlinux.org/title/Power_management#Power_management_with_systemd) - 20230130
* [Power management - suspend and hibernate](https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate)
* [Power states](https://www.kernel.org/doc/Documentation/power/states.txt)
* [Sleep hooks](https://wiki.archlinux.org/index.php/Power_management#Sleep_hooks)
* [Suspend and hbernate](https://wiki.gentoo.org/wiki/Suspend_and_hibernate)
* [Suspend to disk/ram with linux.](http://karellen.blogspot.de/2013/07/suspend-to-diskram-with-linux.html)

