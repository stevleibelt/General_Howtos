# list available usb ports

    ```
    lsusb
    #as a tree (good if you have hubs inside)
    lsusb -t
    ```

# have a look to the physical device list

    ```
    ls -halt /sys/bus/usb/devices/
    ```
 
# disable a usb

    ```
    #"1-0" can be fetched by "list available usb ports"
    #echo -n '<bus>-1:1.0' > /sys/bus/usb/drivers/usb/unbind
    echo -n '1-0:1.0' > /sys/bus/usb/drivers/usb/unbind
    ```
 
# enable a usb

    ```
    #"1-0" can be fetched by "list available usb ports"
    #echo -n '<bus>-1:1.0' > /sys/bus/usb/drivers/usb/bind
    echo -n '1-0:1.0' > /sys/bus/usb/drivers/usb/bind
    ```

# links

* http://lwn.net/Articles/143397/
* http://diego.assencio.com/?index=5e41315c9dedf9fd1d27776c1df18509
