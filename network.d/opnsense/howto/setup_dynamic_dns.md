# Setup DynDNS nsupdate.info

## HowTo

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

## Links

* [Dynamic DNS](https://docs.opnsense.org/manual/dynamic_dns.html?highlight=dynamic) - 20221020

