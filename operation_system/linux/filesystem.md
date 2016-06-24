# setup

* /bin  -   executable binaries for everyone
* /boot -   bootloader
* /dev  -   devices as files
* /etc  -   configuration files for programms
* /home -   place for user files
* /lib  -   shared libraries
* /mnt  -   place where other filesystems should be mounted
* /proc -   processes as files
* /sbin -   system binaries
* /tmp  -   place for temporary files
* /usr  -   binaries for user programms (not system dependend) (should be read only mountable)
* /var  -   place where binaries should write data

# /proc

* cmdline       -   current kernel boot parameters
* cpuinfo       -   cpuinfo
* devices       -   kernel loaded device drivers
* dma           -   known dma channels and devices
* filesystems   -   list of kernel supported file systems
* interrupts    -   used hardware interrupts
* ioports       -   list of known io ports
* kcore         -   identical in size of the memory
* kmsg          -   kernel messages
* locks         -   list of active file logs
* meminfo       -   memory info
* modules       -   list of loaded kernel modules
* mounts        -   list of mounted files
* stat          -   kernel status informations
* sys           -   general runtime informations
* uptime        -   uptime in seconds / idletime in seconds

# links

* http://www.problem-hilfe.de/linux/h/Grundlagen/Dateiverwaltung.html
