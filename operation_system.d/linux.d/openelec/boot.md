# change boot arguments

```
#since flash is mounted read only, we have to remount it to enable writing
mount -o remount,rw /flash

#open boot file and add or remove your boot option
#for x86 systems
vi /flash/extlinux.conf
#for raspberry pi or arm systems
vi /flash/cmdline.txt

#after chaning, we have to remount it to disable writing
sync
mount -o remount.ro /flash

reboot
```

# boot argmuemnts

* ssh                   - enable ssh
* wol_mac=<mac address> - send WOL packet to corresponding MAC address
* wol_wait=<seconds>    - wait corresponding seconds until continuing booting after sending WOL packet
* textmode              - boots into terminal
* installer             - runs openelec installer
* debugging             - enable debugging, output of init scripts, starts shell via CTRL+ALT+F3
* progress              - prints progress while booting
* nofsck                - disables fsck disk upon boot
* nosplash              - disables splash screen
* noram                 - system will not boot to ram (default on machines with less than 1GB of ram)
* live                  - /storage will be mounted via tmpfs and ereased upon shutdown
* overlay               - usefull if you want to do a PXE boot from the NFS or CIFS and use the local mac address as uniq identifier
* break=<boot step>     - opens a local console after corresponding boot step (load_modules, check_disks, mount_flash, load_splash, mount_storrage, check_update)

# links

* http://wiki.openelec.tv/index.php/Boot_Arguments
