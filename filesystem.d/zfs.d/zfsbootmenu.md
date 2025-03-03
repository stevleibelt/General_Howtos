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

## Update zfsbootmenu

```bash
cd /efi/EFI/ZDM
mv vmlinuz.EFI vmlinuz.EFI.bak
# caution, check if vmlinuz.EFI is the image you want to load
#   efibootmgr | grep -i zfsbootmenu
wget https://get.zfsbootmenu.org/latest.EFI -O /efi/EFI/zbm/vmlinuz.EFI
```

## Example configuration file for arch linux

Based on zfsbootmenu version 3.0.

```bash
# ref: https://docs.zfsbootmenu.org/en/v3.0.x/general/container-building/example.html
cat > /etc/zfsbootmenu/config.yaml <<EOF
Global:
  BootMountPoint: /efi
  InitCPIO: true
  ManageImages: true

Components:
  Enabled: false

EFI:
  Enabled: true
  ImageDir: /efi/EFI/ZDM
  Versions: false
Kernel:
  CommandLine: ro quiet loglevel=0 zbm.import_policy=hostid
EOF
```

You can call `generate-zbm -d` to get debug information.

## Links

* [Install arch Linux on ZFS](https://wiki.archlinux.org/title/Install_Arch_Linux_on_ZFS#Generate_a_ZFSBootMenu_image) - 20230109
* [zfsbootmenu on github](https://github.com/zbm-dev/zfsbootmenu) - 20230109
