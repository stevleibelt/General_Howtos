# Disk layout

| UEFI/GPT | BIOS/MS-Dos | Mountpoint |
| --- | --- | --- |
| /dev/sdx1 Fat32 BOOT_A ESP | /dev/sdx1 EXT3 BOOT_A | /boot |
| /dev/sdx2 ZFS [MIRROR] | /dev/sdx2 ZFS [MIRROR] | |

# Zpool layout

| Zpool | Mountpoint |
| --- | --- | --- |
| <zpool>/ROOT | none |
| <zpool>/ROOT/arch | / |
| <zpool>/home | /home |
| <zpool>/pkg | /var/cache/pacman/pkg | 
| <zpool>/log | /var/log |

# Boot Loader

## /boot/syslinux/syslinux.cfg

```
LABEL arch-stable
    MENU LABEL Arch Linux Stable
    LINUX ../vmlinuz-linux-stable
    APPEND zfs=rpool/ROOT/STABLE rw
    INITRD ../initramfs-linux-stable.img

LABEL arch-oldstable
    MENU LABEL Arch Linux Oldstable
    LINUX ../vmlinuz-linux-oldstable
    APPEND zfs=rpool/ROOT/OLDSTABLE rw
    INITRD ../initramfs-linux-oldstable.img
```

## /systemd/boot

# link

* [Total Arch Linux ein Workshop von unicks.eu](https://phoenix-blog.de/2017/10/28/total-arch-linux-ein-workshop-von-unicks-eu/)
    * [Total Arch Linux | S1.1 Arch Linux on ZFS (Deutsch)](https://www.youtube.com/watch?v=qYIUc2V6-oQ)
* [Systemd-Boot](https://wiki.archlinux.org/index.php/Systemd-boot)
* [Syslinux](https://wiki.archlinux.org/index.php/Syslinux)
