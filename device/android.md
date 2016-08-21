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
#   https://aykevl.nl/android
#   http://forum.xda-developers.com/galaxy-s5-mini/development/g800f-m-y-cyanogenmod-13-0-g800f-m-y-t3234909
#press the following buttons when you are on a restart
#volumn uo + power on + home button
#make a backup to your external storage (sd card)
#install new version
#clean the cache
#   just an update: dalvik cache and cache
#   new rom: dalvik cache, cache, system and data
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
