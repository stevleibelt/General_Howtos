# Admininstrate and maintain a webcam with linux

Ease up things by installing `v4l2`.
If you like gui settings, install `gucview`.

The settings your a doing are lost whenever your system reboots or you disconnect the camera, you have to reset all.
Best idea is to save your settings in a small shell script you execute before you do your work with the camera.

```
#list all devices
v4l2-ctl --list-devices

#list configuration values for a device
v4l2-ctl -d /dev/video0 --list-ctrls

#configure a value
v4l2-ctl -d /dev/video0 --set-ctrl=brightness=128
```

# Links

* [webcam setup - wiki.archlinux.org](https://wiki.archlinux.org/index.php/Webcam_setup) - 20200922
