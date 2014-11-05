# steps

## setup

* sudo pacman -S archiso
* sudo mkdir <path to the temporary iso directory>
* cd <path to the temporary iso directory>
* sudo cp -r /usr/share/archiso/configs/releng/ .

## [configuration](https://wiki.archlinux.org/index.php/Archiso#Configure_our_live_medium)

* cd releng
* modify the fitting packages.* files and add needed packages

## build

    sudo ./build.sh -v

# links

* https://wiki.archlinux.org/index.php/Archiso
* https://wiki.archlinux.org/index.php/ZFS#Embed_the_archzfs_packages_into_an_archiso
* http://kroweer.wordpress.com/2011/09/07/creating-a-custom-arch-linux-live-usb/
