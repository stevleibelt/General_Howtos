# Samsung Galaxy S2 Plus I9050p

## Cyanogenmod (currently 13)

### Links

* [cm13](https://s.basketbuild.com/devs/GHsR/CM-13/i9105p)
* [opengapps](http://opengapps.org/?download=false&arch=arm&api=6.0)
* [unofficial builds](http://wiki.cyanogenmod.org/w/Unofficial_Ports#Samsung_Galaxy_S_II_Plus_.28GT-I9105P.29)
* [github page](https://github.com/andixlm/android_device_samsung_i9105p)
* [xda-developers page](http://forum.xda-developers.com/galaxy-s2-plus/orig-development/rom-cyanogenmod-12-1-t3084287)
* [link to the cm12 rom](https://s.basketbuild.com/devs/andixlm/CM12/i9105p)
* [link to the cm12.1 rom](https://s.basketbuild.com/devs/andixlm/CM12.1/i9105p)
* [link to google apps on opengapps.org](http://opengapps.org/?download=true&arch=arm&api=5.1&variant=full)
    * [link to comparison page](https://github.com/opengapps/opengapps/wiki/Package-Comparison)
* [link to google apps on github.com](https://github.com/cgapps/vendor_google)
    * [link to gapps 5.1 for arm](https://github.com/cgapps/vendor_google/raw/builds/arm/gapps-5.1-arm-2015-07-17-13-29.zip)
    * [link to md5 of gapps 5.1 for arm](https://github.com/cgapps/vendor_google/raw/builds/arm/gapps-5.1-arm-2015-07-17-13-29.md5)
* [link to google apps on basketbuild.com](https://s.basketbuild.com/gapps)
* [how to root a i9050p](http://forum.xda-developers.com/showthread.php?t=2663834)
* [twrp for i9050p](https://twrp.me/devices/samsunggalaxys2plus.html)

### howto

#### [installation](http://forum.xda-developers.com/showpost.php?s=2a932624b48474120f9bf605a3c2c22c&p=56828216&postcount=2)

* make a backup
* if you were on CM 10.1 or a stock ROM prior to 4.2, upgrade to 4.2.
* install clockworkMod recovery with SELinux support. Older CWM will result in a "status 7" error.
* reboot into recovery
    * shutdown device
    * press "volume up" + "home" + "power"
* wipe data (/factory reset) if coming from stock or another non-CM ROM (You may get a "status 7" error if you fail to wipe.)
* wipe cache 
* install the ROM
* optionally install the Google Apps Addon
