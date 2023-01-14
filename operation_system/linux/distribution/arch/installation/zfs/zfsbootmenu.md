# Install arch linux on an encrypted zfs root by using zfsbootmenu

## The automatic way

```
#boot archiso
#do basic things
#@see: https://wiki.archlinux.org/title/Installation_guide#Boot_the_live_environment

loadkeys de

#init zfs module and install git
curl -s https://eoli3n.github.io/archzfs/init | bash

#get install scripts
git clone https://github.com/eoli3n/arch-config
bash arch-config/scripts/zfs/install/01-configure.sh
bash arch-config/scripts/zfs/install/02-install.sh
```

## Configuration

```
#boot archiso
#@see: https://wiki.archlinux.org/title/Installation_guide#Boot_the_live_environment
loadkeys de-latin1

#bo: test
modprobe zfs
ls /sys/firmware/efi/efivars
#eo: test

#bo: wifi
iwctl
#_if no wps is possible
device list
station <device> scan
station <device> get-networks
station <device> connect <ssid>
#_if wps is possible
#press wps button
wsc list
wsc <device> push-button

exit
#eo: wifi

ping bazzline.net

timedatectl set-timezone Europe/Berlin
timedatectl set-ntp true

#bo: adding archzfs
pacman -Syy archlinux-keyring --noconfirm &>/dev/null
pacman-key --populate archlinux &>/dev/null
pacman-key --recv-keys F75D9D76 &>/dev/null
pacman-key --lsign-key F75D9D76 &>/dev/null
cat >> /etc/pacman.conf <<"EOF"
[archzfs]
Server = http://archzfs.com/archzfs/x86_64
Server = http://mirror.sum7.eu/archlinux/archzfs/archzfs/x86_64
Server = https://mirror.biocrafting.net/archlinux/archzfs/archzfs/x86_64
EOF
pacman -Sy &>/dev/null
#eo: adding archzfs

DISK="/dev/disk/by-id/<id>"
read -r -p "> Please insert ZFS passphrase: " -s PASSPHRASE

echo "${PASSPHRASE}" > /etc/zfs/zroot.key
chmod 000 /etc/zfs/zroot.key

#wipe

dd if=/dev/zero of="${DISK}" bs=512 count=1
wipefs -af "${DISK}"
sgdisk -af "${DISK}"

#partition
```

## Installation

```
```

## Links

* [archiso-zfs by eoli3n](https://github.com/eoli3n/archiso-zfs) - 20220624T22:21:40
* [arch-config by eoli3n](https://github.com/eoli3n/archiso-config) - 20220624T22:22:10

