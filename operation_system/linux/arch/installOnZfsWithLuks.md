# steps

* follow the steps in the official [arch linux wiki](https://wiki.archlinux.org/index.php/Installing_Arch_Linux_on_ZFS#Embedding_archzfs_into_archiso)
* when it comes to the point of adapting the grub.cfg, the "linux" section should look like:
    ```
    linux   /vmlinuz-linux zfs=<zpool name> rw cryptdevice=/dev/disk/by-uuid/<uuid of raw device/parition>:<decrypted device name/identifier> quit
    ```
