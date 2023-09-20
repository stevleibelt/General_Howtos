# example

Example is based on [arch linux](https://www.archlinux.org).

We are using 
    * /opt/xen/ as basepath for our domains.
    * lvm to manage and create dedicated domain disk below /opt/xen/<domain name>.
    * the lts kernel

You can check if your hardware supports HVM with:
```
grep -E "(vmx|svm)" --color=always /proc/cpuinfo
```

You can check if your hardware supports PCI passthrough with:
```
dmesg|grep -e DMAR -e IOMMU
```

## prepare the disk

```
# list lvm capable devices
lvmdiskscan

# create pv
pvcreate <path to the device>
pvdisplay

vgcreate <volume group identifier> <physical volume identifier>
vgdisplay

lvcreate -L 512M <volume group identifier> -n boot
lvcreate -L 8G <volume group identifier> -n root
lvcreate -L 2G <volume group identifier> -n var
lvcreate -L 2G <volume group identifier> -n etc
lvcreate -L 2G <volume group identifier> -n swap
lvcreate -L 2G <volume group identifier> -n tmp

# format
mkfs.ext2 /dev/mpaper/<volume group identifier>/boot
mkfs.ext4 /dev/mapper/<volume group identifier>/root
mkfs.ext4 /dev/mapper/<volume group identifier>/var
mkfs.ext4 /dev/mapper/<volume group identifier>/etc
mkfs.ext4 /dev/mapper/<volume group identifier>/boot

# add support in mkinitcpio.conf
# put >>lvm2<< after the >>block<< but before the >>filesystems<< hook
```

## install the base system

Do like the [wiki](https://wiki.archlinux.org/index.php/Installation_guide) says.

## install xen

* enable [multilib](https://wiki.archlinux.org/index.php/Multilib) repository
* install [multilib-devel](https://www.archlinux.org/groups/x86_64/multilib-devel/)
* install [xen](https://aur.archlinux.org/packages/xen/) from [aur](https://wiki.archlinux.org/index.php/Arch_User_Repository) [manually](https://wiki.archlinux.org/index.php/Arch_User_Repository#Installing_packages)
* install [seabios](https://www.archlinux.org/packages/?name=seabios) or [ovmf](https://www.archlinux.org/packages/?name=ovmf)
* enable following systemd service
    * xenstored
    * xenconsoled
    * xendomains
    * xen-init-dom0

## install bootloader

* edit /etc/xen/grub.conf to add your preferredn dom0 setting
    * e.g. >>XEN_HYPERVISOR_CMDLINE="dom0_mem=512M xsave=1"<<
    * grub-mkconfig -o /boot/grub/grub.cfg
* create xenfs filesystem mount point in /etc/fstab
```
none    /proc/xen   xenfs   defaults    0   0
```

## create a network bridge

* read [xen networking](https://wiki.xen.org/wiki/Xen_Networking)
* check /etc/xen/scripts
* read [create a network bridge](https://wiki.alpinelinux.org/wiki/Bridge)

## reboot and verify

* reboot
* xl list   #Domain-0 should be up and running

## setup firewall

* take [this](https://wiki.archlinux.org/index.php/DeveloperWiki:Dom0) as reference

# link

* [XEN on archlinux](https://wiki.archlinux.org/index.php/Xen)
* [PCI passthrough via OVMF](https://wiki.archlinux.org/index.php/PCI_passthrough_via_OVMF)
* [LVM on archlinux](https://wiki.archlinux.org/index.php/LVM)
* [Install archlinux](https://wiki.archlinux.org/index.php/Installation_guide)
* [AUR on archlinux](https://wiki.archlinux.org/index.php/Arch_User_Repository)
* [pacaur - my preferred solution interacting with aur](https://github.com/rmarquis/pacaur)
* [xen networking](https://wiki.xen.org/wiki/Xen_Networking)
* [xen best practices](http://wiki.xen.org/wiki/Xen_Best_Practices)
* [xen guest install](http://wiki.xen.org/wiki/Category:Guest_Install)
* [xen dom0 on alpine linux](https://wiki.alpinelinux.org/wiki/Xen_Dom0)
* [xen dom0 on usb or sd](https://wiki.alpinelinux.org/wiki/Xen_Dom0_on_USB_or_SD)
