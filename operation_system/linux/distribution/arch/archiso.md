# steps

## setup

```
#this will install the releng iso since we want to customize the iso
sudo pacman -S archiso
sudo mkdir <path to the temporary iso directory>
cd <path to the temporary iso directory>
sudo cp -r /usr/share/archiso/configs/releng/ .
```

## [configuration](https://wiki.archlinux.org/index.php/Archiso#Configure_our_live_medium)

```
cd <path to the temporary iso directory>
#we want to add the archzfs-linux" package
echo "archzfs-linux" >> packages.x86_64

#we want to do some administrativ tasks
echo "systemctl daemon-reload" >> airootfs/root/customize_airootfs.sh
echo "systemctl daemon-reload" >> airootfs/root/customize_airootfs.sh
echo "systemctl enable zfs-import-cache zfs-import-scan zfs-mount zfs-share zfs-zed" >> airootfs/root/customize_airootfs.sh
```

## build

```
#"out" is the default directory where
# the iso will be created
mkdir out
sudo ./build.sh -v
```

# links

* https://wiki.archlinux.org/index.php/Archiso
* https://wiki.archlinux.org/index.php/Remastering_the_Install_ISO
* https://wiki.archlinux.org/index.php/ZFS#Embed_the_archzfs_packages_into_an_archiso
* http://kroweer.wordpress.com/2011/09/07/creating-a-custom-arch-linux-live-usb/
