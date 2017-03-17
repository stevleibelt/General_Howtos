# how to install grub

## if currently booted by a live cd

```
mount root (and if available boot) partition under /mnt (/mnt/boot)
grub-install --root-directory=/mnt /dev/<device>
```

## else

```
grub-install /dev/<device>
```

# where is what stored

## entries

```
/etc/grub.d/
```

## configuration

```
#template for the generation of the grub.cfg
#use this file for adapt grub for your 
/etc/default/grub
#/etc/grub.d/* contains files for the generation - do not modify them
#file generated on each new kernel update
/boot/grub2/grub.cfg
```

### /etc/default/grub

Some important keys.

* GRUB\_TIMEOUT             - int, seconds to show the menu
* GRUB\_DISTRIBUTOR         - string, distribution name
* GRUB\_DEFAULT             - int|string, either the index in the grub.cfg or the exact file name of the kernel
* GRUB\_CMDLINE\_LINUX      - string, arguments passed to each kernel entries
* GRUB\_DISABLE\_RECOVERY   - string, false enables recovery entry, true disables recovery entry

### disable submenu

```
GRUB_DISABLE_SUBMENU=y
```

### change default menu entry

```
GRUB_DEFAULT=0
```

# how to build build

```
grub-mkconfig > /boot/grub/grub.cfg
```

# links

* [tips and tricks](https://wiki.archlinux.org/index.php/GRUB/Tips_and_tricks)
* [configuration](https://opensource.com/article/17/3/introduction-grub2-configuration-linux)
* [grub manual online](https://www.gnu.org/software/grub/manual/grub.html#Simple-configuration)
