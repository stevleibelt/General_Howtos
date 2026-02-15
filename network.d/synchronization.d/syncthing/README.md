# Syncthing

## Setup in LAN-usage only

* Enable `NAT traversal`
* Enable `Local Discovery`
* Disable `Global Discovery`
* Disable `Enable Relaying`
* If possible, provide the addresses of the target
  * IP Address is good enough like `tcp://192.0.168.123`

## Access Web-Gui from other computer

```bash
# ref: https://docs.syncthing.net/users/faq.html#how-do-i-access-the-web-gui-from-another-computer
# Find path to configuration
# Search for -home
systemctl edit syncthing.service
cd /path/to/syncthing/config.yml

# find following lines
# <gui enabled="true" tls="false">
#  <address>127.0.0.1:8384</address>
# replace with
# <gui enabled="true" tls="true">
#  <address>0.0.0.0:8384</address>
```

## Links

* [Arch linux wiki link](https://wiki.archlinux.org/title/Syncthing) - 20221202

