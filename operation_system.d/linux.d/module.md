# Linux and modprob

## Load, reload or unload module

```bash
# load module
modprobe <module name>

# reload module
modprobe -r <module name>

# remove module
rmmod <module name>
```

## List modules

```bash
lsmod | grep <string: my_module>
less /proc/modules
grep <string: my_module> /proc/modules

# list modules of the current kernel
ls /lib/modules/`uname -r`

# list used sub directories of the current kernel
ls /lib/modules/`uname -r`/kernel

# list available modules
modprobe -c
```

## Disable module

### Disable loading of usb ports

```bash
# prevents module from being loaded, automatically or manually
echo 'install usb-storage /bin/false' > /etc/modprobe.d/disable_usb_storage.conf
```

### Disable automatically loading of pcspeaker

@see: https://wiki.archlinux.org/index.php/PC_speaker

```bash
# prevents module from being loaded automatically
#   it is still possible to load it manually
echo 'blacklist pcspkr' > /etc/modprobe.d/disable_pcsprk.conf
```

## Links

* [how to load or unload linux kernel modules.](https://opensource.com/article/18/5/how-load-or-unload-linux-kernel-module)

