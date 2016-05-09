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
echo "archzfs-linux" > packages.x86_64
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
* https://wiki.archlinux.org/index.php/ZFS#Embed_the_archzfs_packages_into_an_archiso
* http://kroweer.wordpress.com/2011/09/07/creating-a-custom-arch-linux-live-usb/
