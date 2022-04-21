# NetworkManager

* Can be seen as the defacto new standard instead of `ifconfig` and `ip`
* Uses `systemd`, `udev` and `D-Bus`
* Comes with `nmtui` as ncursed frontend and [nmcli](nmcli.md)) as command line interface
* Stores its information in `/etc/NetworkManager/system-connections`
    * Since this files can contain passwords in plain text, files in this path are `r+w` by `root` only
* Supports the usage of old network interface configuration files located in `/etc/sysconfig/network-scripts` (`ifcfg-*`)

# Links

* [Get started with NetworkManager on Linux](https://opensource.com/article/22/4/networkmanager-linux) - 20220421
