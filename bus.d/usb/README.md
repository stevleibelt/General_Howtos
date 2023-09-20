# USB

## List available hubs and connected devices

```
lsusb
#or to get the tree like structure
lsusb -t
#if you want to know more
lsusb -v
```

## Enable or disable device

```
#disable device / power down
echo '1-1.3' > /sys/bus/usb/drivers/usb/unbind
#enable device / power up
echo '1-1.3' > /sys/bus/usb/drivers/usb/bind

#as alias
alias disableUsbDeviceFoo='sudo su -c \"echo '1-1.3' > /sys/bus/usb/drivers/usb/unbind\"""
alias enableUsbDeviceFoo='sudo su -c \"echo '1-1.3' > /sys/bus/usb/drivers/usb/bind\"""
```
