# Opnsense

* default password for `root` and `installer` is `opnsense`

## Setup

### Setup Telekom FTTH/Glasfaser via PPPoE

* `Interfaces` -> `other types` -> `VLAN` (`https://<opnsense ip>/interfaces_vlan.php`)
    * Create new VLAN-Interface:
        * Parent Interface: <wan interface>
        * VLAN-Tag: `7`
        * VLAN Priority: 0
        * Description: `telekom vlan`
* WAN-Interface (`https://<opnsense ip>/interfaces.php?if=wan`):
    * Choose device pppoe
    * IPv4 Configuration: PPPoE
    * PPPoE Configuration:
        * Username|Benutzername: <connection identifier|Anschlusskennung><access number|Zugangsnummer>0001@t-online.de
        * Password|Passwort: <personalized password|Persöhnliches Kennwort>
        * Servicename|Dienstname: `telekom`
* Check:
    * `System` -> `Gateways` (`https://<opnsense ip>/system_gateways.php`)
    * Remove all the gateways not named like `WAN_PPPOE`

### Setup DNS Servers

* `System` -> `Settings` -> `General` (`https://<opnsense ip>/system_general.php`)
    * `General` -> `DNS Server`
    * Add the one you want like:
        * `80.241.218.68`, Gateway: <your WAN>
        * `159.69.114.157`, Gateway: <your WAN>
        * `176.9.93.198`, Gateway: <your WAN>
        * `176.9.1.117`, Gateway: <your WAN>

### Setup DynDNS nsupdate.info

* `System` -> `Firmware` -> `Plugins`
  * Search fpr `os-dyndns` and install it
* Reload GUI
* `Services` -> `Dynamic DNS (legacy)` (`https://<opnsense ip>/services_dyndns_edit.php`)
  * `Add`
  * Enabled: yes
  * Type of service: custom
  * Used interface: WAN
  * Interface where updates are sent from: WAN
  * Hostname: `<your name>.nsupdate.info`
  * CURL options: force ipv4 name resolution
  * Username: `<your name>.nsupdate.info`
  * Password: `<password>`
  * Update URL: `https://ipv4.nsupdate.info/nic/update`
  * Result Check: `good %IP%|nochg %IP%`
  * Description: `update DDNS host with IP v4 address`

### Possible usefull plugins

* [clamav](https://docs.opnsense.org/manual/how-tos/clamav.html) - 20230213
* [git-backup](https://docs.opnsense.org/manual/git-backup.html) - 20230213
* [ntopng](https://docs.opnsense.org/manual/how-tos/ntopng.html) - 20230213
* [tor](https://docs.opnsense.org/manual/how-tos/tor.html) - 20230213
* [wireguard](https://docs.opnsense.org/manual/how-tos/wireguard-client.html) - 20230213

## Update

### From cli

First, you need to enable ssh and sudo support for your cli user.

Go to `System -> Settings -> Administration` and search for `sudo`. (`https://<opnsense ip>/system_advanced_admin.php`)
Set `ask for password` and add the group `admins` to it.

Furthermore, you need to create a user. (`https://<opnsense ip>/system_usermanager.php`)

```
ssh <user>@<opnsense ip>
#if needed
sudo /usr/local/sbin/opnsense-shell
12

#if you run into the issue >>A firmware action is currently in progress.<< (of course only if there is no upgrade in progress)
sudo pkg update -f
#to reinstall all packages
sudo pkg upgrade -f
#just for new ones
sudo pkg upgrade -f
```

## Link

* [opnsense](http://opnsense.org/) - 20211028

