# Linux and modprob

## Load, reload or unload module

```bash
#load module
modprobe <module name>

#reload module
modprobe -r <module name>

#kill module
rmmod <module name>
```

## List modules

```bash
lsmod
less /proc/modules

#list modules of the current kernel
ls /lib/modules/`uname -r`

#list used sub directories of the current kernel
ls /lib/modules/`uname -r`/kernel

#list available modules
modprobe -c
```

## Disable module

### Disable usb ports

```bash
echo 'install usb-storage /bin/true' > /etc/modprobe.d/disable_usb_storage.conf
```

### Disable pcspeaker

@see: https://wiki.archlinux.org/index.php/PC_speaker

```bash
echo 'blacklist pcspkr' > /etc/modprobe.d/disable_pcsprk.conf
```

## Links

* [how to load or unload linux kernel modules.](https://opensource.com/article/18/5/how-load-or-unload-linux-kernel-module)

