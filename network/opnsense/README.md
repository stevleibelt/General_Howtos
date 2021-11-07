# General

* default password for `root` and `installer` is `opnsense`

# Setup

## Setup Telekom FTTH/Glasfaser via PPPoE

* `Interfaces` -> `other types` -> `VLAN` (`https://<your opnsense ip>/interfaces_vlan.php`)
    * Create new VLAN-Interface:
        * Parent Interface: <wan interface>
        * VLAN-Tag: `7`
        * VLAN Priority: 0
        * Description: `telekom vlan`
* WAN-Interface (`https://<your opnsense ip>/interfaces.php?if=wan`):
    * Choose device pppoe
    * IPv4 Configuration: PPPoE
    * PPPoE Configuration:
        * Username|Benutzername: <connection identifier|Anschlusskennung><access number|Zugangsnummer>0001@t-online.de
        * Password|Passwort: <personalized password|Persöhnliches Kennwort>
        * Servicename|Dienstname: `telekom`
* Check:
    * `System` -> `Gateways` (`https://<your opnsense ip>/system_gateways.php`)
    * Remove all the gateways not named like `WAN_PPPOE`

## Setup DNS Servers

* `System` -> `Settings` -> `General` (`https://<your opnsense ip>/system_general.php`)
    * `General` -> `DNS Server`
    * Add the one you want like:
        * `80.241.218.68`, Gateway: <your WAN>
        * `159.69.114.157`, Gateway: <your WAN>
        * `176.9.93.198`, Gateway: <your WAN>
        * `176.9.1.117`, Gateway: <your WAN>

## Setup DynDNS nsupdate.info

* `Services` -> `Dynamic DNS` (`https://<your opnsense ip>/services_dyndns_edit.php`)
    * `Add`
    * activate: yes
    * Type of service: custom
    * Used interface: WAN
    * Interface where updates are sent from: WAN
    * Hostname: <your name>.nsupdate.info
    * CURL options: use ipv4 name resolution
    * Username: <your name>.nsupdate.info
    * Password: <password>
    * Update URL: `https://ipv4.nsupdate.info/nic/update`
    * Result Check: `good %IP%|nochg %IP%`
    * Description: `update DDNS host with IP v4 address`

# link

* [opnsense](http://opnsense.org/) - 20211028
