# Setup IPv4 dynamic dns for nsupdate.info on Opnsense

## HowTo

* `System` -> `Firmware` -> `Plugins` (`https://<string: opnsense_ip>/ui/core/firmware#plugins`)
  * Search for `os-ddclient` and install it
* Reload GUI
* `Services` -> `Dynamic DNS)` -> `Settings` (`https://<string: opnsense ip>/ui/dyndns`)
  * `Add`
  * Enabled: yes
  * Service: nsupdatev4
  * Description: `nsupdate_ipv4`
  * Username: `<string: username>.nsupdate.info`
  * Password: `<string: password>`
  * Hostnames: `<string: username>.nsupdate`
  * Check ip method: `nsupdate.info-ipv4`
  * Check ip timeout: `10`
  * Force SSL: yes

## Links

* [Dynamic DNS](https://docs.opnsense.org/manual/dynamic_dns.html?highlight=dynamic) - 20221020

