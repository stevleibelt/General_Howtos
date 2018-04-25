# enable device for adb

* settings->about device->tap seven times
* settings->developer options->enable usb debugging
* sometimes you need to restart your device

# unblock bootloader

* connect device via usb to pc
* check that device is listed by "adb devices"
    * if you get something like that "no permissions; see [http://developer.android.com/tools/device.html]"
    * do following (even multiple times)
        * sudo adb kill-server
        * sudo adb start-server
        * sudo adb devices
        * adb devices
    * you should get an "authorizes question"
* "adb reboot bootloader"
* verify with "fastboot devices" (maybe with sudo)
* start unblocking with "fastboot flashing unlock" (maybe with sudo)
* reboot device
* reenable usb debugging

# install custom rom

* download something like twrp
* connect device with pc
* check that device is listed by "adb devices"
* "adb reboot bootloader
* verify with "fastboot devices"
* "fastboot flash recovery twrp-x.y.z-hammerhead.img
* test that all went well by reboot and press "volume-down"+"power"
    * if you get "no command"
    * press "power"+"volume-up"
    * release "power" and select what you want to do
* enable adb sideload in twrp on the device -> advanced->adb sideload
* type "adb sideload <path to the file>" to copy stuff to your device
    * if not working, try "adb push <path to the file>" /sdcard

# use the shell to check external storage

* adb shell
* mount
* /system/bin/fsck_msdos -yf /dev/block/mmcblk1p1
