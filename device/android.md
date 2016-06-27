# mounting

* if you are using pcmanfm or gnome, "gvfs-mtp" is worth to have a look

```
#fuse based
jmtpfs <path to the mountpoint>
```

# unmounting

```
#assuming you are using jmtpfs
fusermount -u <path to the mountpoint>
```

# flash a system

```
#e.g. samsung galaxy s5 mini (SM-G800F)
#http://forum.xda-developers.com/sitesearch.php?q=galaxy%20s5%20mini
#   http://forum.xda-developers.com/galaxy-s5-mini/development/g800f-m-y-cyanogenmod-13-0-g800f-m-y-t3234909
#   http://wiki.cyanogenmod.org/w/Install_CM_for_klte
#press the following buttons when you are on a restart
#volumn down + power on + home button
```

# file system hirachy

```
/boot       - initram
/cache      - application cache
/data       - user data
/data/data  - application data
/dev        - devices
/mnt/asec   - encrypted applications (App2SD)
/mnt/emmc   - internal sdcards
/mnt/sdcard - external sdcards
/proc       - process informations
/recovery   - recovery system
/system     - system rom (read only)
```

In general, applications can store their data where they want.

# links

* https://wiki.archlinux.org/index.php/MTP
* http://www.xda-developers.com
* http://opengapps.org
* http://android.stackexchange.com/tags/file-system/info
* http://android.stackexchange.com/tags/partition/info
* http://android.stackexchange.com/questions/46926/android-folder-hierarchy/46934#46934
