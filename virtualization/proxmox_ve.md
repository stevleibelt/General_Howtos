# installation

* [download](https://www.proxmox.com/en/downloads/category/iso-images-pve) iso
* `sudo dd if=proxmox-ve_*.dmg of=/dev/rdiskX bs=1m` (if you use rufus, use `dd mode`)
* `vim /etc/apt/sources.list.d/pve-enterprise.list`, comment out the line there
* `echo "deb [trusted=yes] http://www.deb-multimedia.org buster main" > /etc/apt/sources.list.d/pve-no-subscription`
    * [see](https://www.svennd.be/proxmox-ve-5-0-fix-updates-upgrades/)

# upgrade

* [upgrade from proxmoxve 6 to proxmoxve 7](https://pve.proxmox.com/wiki/Upgrade_from_6.x_to_7.0)

# ntp

```
timedatectl set-timezone Europe/Berlin
apt install systemd-timesyncd
vim /etc/systemd/timesyncd.conf #set your ntp servers
systemctl start systemd-timesyncd
systemctl status systemd-timesyncd
systemctl enable systemd-timesyncd

#check
timedatectl
```

# links

* [HA Proxmox Cluster with Shared Storage](https://networkingdream.com/server/ha-proxmox-cluster-with-shared-storage/) - 20210930
* [Prepare installation media](https://pve.proxmox.com/wiki/Prepare_Installation_Media) - 20210215
* [Official admin guide](https://pve.proxmox.com/pve-docs/pve-admin-guide.html) - 20210412
* [Official wiki](https://pve.proxmox.com/wiki/Main_Page) - 20210412
