# liste detected disks

    ```
    fdisk -l
    #or
    lsblk
    ```
    fdisk -l

# get connected devices via usb

    ```
    lsusb
    ```

# check dmesg

    ```
    dmesg | grep sd
#or
    dmesg | grep usb
    ```

# check attached pci devices and grep hci

    ```
    lspci -v | grep HCI
    ```

# get uuid

    ```
    blkid /dev/sdX
    ```
