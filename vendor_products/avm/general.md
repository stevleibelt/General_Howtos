# internal system storage

* mtd0 - root filesystem
* mtd1 - linux kernel
* mtd2 - ADAM2 bootloader
* mtd3++ - tffs (transactional (save) flash file system)

# recovery

* fallback ip is 169.254.1.1 or 169.254.1.2

# use the ftp

* set a static ip address on your ethernet device (192.168.178.[2-254])
* disconnect the fritzbox from the power
* open one terminal and execute "ping 192.168.178.1"
* open a second terminal and typ "ftp 192.168.178.1" but do not enter
* the first time you get a pingback hit enter in the ftp console (username adam2 and password adam2)

## available and important variables

```
#enable debugging
debug bin

quote GETENV firmware_version
quote GETENV firmware_info
quote GETENV bootloaderVersion
quote GETENV annex
quote GETENV HWRevision
quote GETENV ProductID
quote GETENV linux_fs_start
quote GETENV provider

#reboot
quote REBOOT
```

## change the branding

```
quote SETENV firmware_version avm
#quote SETENV firmware_version kgd #for kabeldeutschland

#use a different firmware_version
quote SETENV linux_fs_start 1
#set
quote SETENV linux_fs_start 0
```

# links

* [fritzbox 6490 cable bootloop](http://www.ip-phone-forum.de/showthread.php?t=282765)
* [ftp and firmware upgrade on linux](http://www.ip-phone-forum.de/showthread.php?t=242984)
* [something with YourFritz](http://www.ip-phone-forum.de/showthread.php?t=285810&p=2162540&viewfull=1#post2162540)
* [connection via telnet](http://www.wehavemorefun.de/fritzbox/Starten_von_telnetd)
* [list of known brandings](http://www.wehavemorefun.de/fritzbox/Branding)
* [rettung der fritz box](https://www.zebradem.com/wiki/index.php?title=Rettung_f%C3%BCr_die_Fritz_Box)
* [fritzboxtools](http://www.mengelke.de/Projekte/FritzBoxTools)
* list of fritzbox github projects
    * [domain blacklist](https://github.com/fboes/fritzbox-blacklist)
    * [modfs](https://github.com/PeterPawn/modfs)
    * [yourfritz](https://github.com/PeterPawn/YourFritz)
    * [fritzctl](https://github.com/bpicode/fritzctl)
    * [fritzbox.js](https://github.com/lesander/fritzbox.js)
    * [guest wlan shellscript](https://github.com/Ezak91/FritzBox-Guestwlan-Shellscript)
    * [munin plugins](https://github.com/Tafkas/fritzbox-munin)
    * [fritzboxtools](https://github.com/kichkasch/fritzboxtools)
    * [carddav2fritzbox](https://github.com/cmaoling/cardDAV2Fritzbox)
    * [fb tools](https://github.com/f00f/FritzBoxTools)
    * [freetz-docker](https://github.com/mtneug/freetz-docker)
    * [Fritzbox.sh](https://github.com/Tscherno/Fritzbox.sh)
* [list of fritzboxes for openwrt](https://wiki.openwrt.org/toh/avm/start)
