# upower

Upower can be used to check battery/akku life, status and health status.

Furthermore, it can be used to report and enforces system suspend behavior.

## Usage

```bash
# list configured values
grep -v '^#\|^$' /etc/UPower/UPower.conf

# list available devices
upower -e
# or
dbus-send \
    --print-reply \
    --system \
    --dest=org.freedesktop.UPower \
        /org/freedesktop/UPower \
        org.freedesktop.UPower.EnumerateDevices

# list device properties
#   Assuming you have a device called `/org/freedesktop/UPower/devices/battery_BAT0`
upower -b
# or
upower -i /org/freedesktop/UPower/devices/battery_BAT0
# or
dbus-send \
    --print-reply \
    --system \
    --dest=org.freedesktop.UPower \
        /org/freedesktop/UPower/devices/battery_BAT0 \
        org.freedesktop.DBus.Properties.GetAll \
        string:org.freedesktop.UPower.Device

# list all available power sources
upower -e

# list detailed **i**nformation about a source
upower -i /org/freedesktop/UPower/devices/battery_BAT0
```

## Links

* [Official website: freedesktop.org](https://upower.freedesktop.org/) - 20230419
* [wikipedia entry about upower: wikipedia.org](https://en.wikipedia.org/wiki/UPower) - 20230419
* [battop as rust written interactive battery viewer: github.com](https://github.com/svartalf/rust-battop) - 20230419
