# zfsbootmenu

## Set kernel parameter

```bash
#get settings
zfs get org.zfsbootmenu:commandline

#set settings
zfs set org.zfsbootmenu:commandline='rw quiet nowatchdog rd.vconsole.keymap=de ...' zroot/ROOT/archlinux
```

## Set default kernel

* Either do it on boot
* `ESCPAPE` (to go to boot menu) -> `kernels` ->`set default`
* Or do it via commandline

```bash
# ref: https://docs.zfsbootmenu.org/en/latest/online/kernel-management.html
# regular
sudo zfs set org.zfsbootmenu:kernel "vmlinuz-linux"

# lts
sudo zfs set org.zfsbootmenu:kernel "vmlinuz-linux-lts"
```

## Links

* [Install arch Linux on ZFS](https://wiki.archlinux.org/title/Install_Arch_Linux_on_ZFS#Generate_a_ZFSBootMenu_image) - 20230109
* [zfsbootmenu on github](https://github.com/zbm-dev/zfsbootmenu) - 20230109
