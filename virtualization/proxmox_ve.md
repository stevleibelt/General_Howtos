# installation

* [download](https://www.proxmox.com/en/downloads/category/iso-images-pve) iso
* `sudo dd if=proxmox-ve_*.dmg of=/dev/rdiskX bs=1m` (if you use rufus, use `dd mode`)
* `echo "deb [trusted=yes] http://www.deb-multimedia.org buster main" > /etc/apt/sources.list.d/pve-no-subscription`
    * [see](https://www.svennd.be/proxmox-ve-5-0-fix-updates-upgrades/)

# links

* [Prepare installation media](https://pve.proxmox.com/wiki/Prepare_Installation_Media) - 20210215
* [Official admin guide](https://pve.proxmox.com/pve-docs/pve-admin-guide.html) - 20210412
* [Official wiki](https://pve.proxmox.com/wiki/Main_Page) - 20210412
