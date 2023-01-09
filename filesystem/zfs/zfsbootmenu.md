# zfsbootmenu

## Set kernel parameter

```bash
#get settings
zfs get org.zfsbootmenu:commandline

#set settings
zfs set org.zfsbootmenu:commandline='rw quiet nowatchdog rd.vconsole.keymap=de ...' zroot/ROOT/archlinux
```

## Links

* [Install arch Linux on ZFS](https://wiki.archlinux.org/title/Install_Arch_Linux_on_ZFS#Generate_a_ZFSBootMenu_image) - 20230109
* [zfsbootmenu on github](https://github.com/zbm-dev/zfsbootmenu) - 20230109

