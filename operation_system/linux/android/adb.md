# enable device for adb

* settings->about device->tap seven times
* settings->developer options->enable usb debugging
* sometimes you need to restart your device

# unblock bootloader

* connect device via usb to pc
* check that device is listed by "adb devices"
* "adb reboot bootloader"
* verify with "fastboot devices"
* start unblocking with "fastboot oem unlock"
* reboot device
* reenable usb debugging

# install custom rom

* download something like twrp
* connect device with pc
* check that device is listed by "adb devices"
* "adb reboot bootloader
* verify with "fastboot devices"
* "fastboot flash recovery twrp-x.y.z-hammerhead.img
* test that all went well by reboot and press volume-up+volume-down+power
* enable adb sideload in twrp on the device
* type "adb sideload <path to the file>" to copy stuff to your device

# use the shell to check external storage

* adb shell
* mount
* /system/bin/fsck_msdos -yf /dev/block/mmcblk1p1
