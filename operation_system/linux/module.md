# load, reload or unload module

```
#load module
modprobe <module name>

#reload module
modprobe -r <module name>

#kill module
rmmod <module name>
```

# list modules

```
lsmod
less /proc/modules

#list modules of the current kernel
ls /lib/modules/`uname -r`

#list used sub directories of the current kernel
ls /lib/modules/`uname -r`/kernel

#list available modules
modprobe -c
```

# link

* [how to load or unload linux kernel modules.](https://opensource.com/article/18/5/how-load-or-unload-linux-kernel-module)
