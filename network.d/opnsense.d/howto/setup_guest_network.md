# Setup Guest Network on Opnsense

## Howto

* `Interfaces` -> `Assignments` -> `+`
* `Edit`
  * Description: `Guestnetwork`
  * Check that you've assigned it to the right interface
  * `Save`
* `Interfaces` -> `[Guestnetwork]`
  * Enable: `Checked`
  * IPv4 Configuration Type: `Static IPv4`
  * Static IPv4 address: `192.168.179.1/24` (This will enable you the chance to use fritzbox guest network)
  * `Save`
  * `Apply changes`
* `Services` -> `DHCPv4` -> `[Guestnetwork]`
  * Enable: `Checked`
  * Range: `from 192.168.179.100 to 192.168.179.200`
  * DNS Server: `192.168.179.1`
  * Gateway: `192.168.179.1`
  * `Save`
* `Firewall` -> `Rules` -> `Guestnetwork`
  * `+`
  * Protocol: `TCP/UDP`
  * Source: `Guestnetwork net`
  * Destination: `Guestnetwork address`
  * Destination port range: `from DNS to DNS`
  * Category: `GuestNet Basic Rules`
  * Description: `Allow DNS`
  * `Save`
  * `+`
  * Protocol: `TCP`
  * Source: `Guestnetwork net`
  * Destination: `Guestnetwork address`
  * Destination port range: `from other (8000) to other (10000)`
  * Category: `GuestNet Basic Rules`
  * Description: `Allow Captive Portal Login`
  * `Save`
  * `+`
  * Action: `Block`
  * Source: `Guestnetwork net`
  * Destination: `Lan net`
  * Category: `GuestNet Basic Rules`
  * Description: `Block Local Networks`
  * `Save`
  * `+`
  * Action: `Block`
  * Source: `Guestnetwork net`
  * Destination: `Guestnetwork address`
  * Category: `GuestNet Basic Rules`
  * Description: `Block Firewall Access`
  * `Save`
  * `+`
  * Source: `Guestnetwork net`
  * Category: `GuestNet Basic Rules`
  * Description: `Allow Guest Network`
  * `Save`
  * `Apply changes`

## Links

* [Official Documentation](https://docs.opnsense.org/manual/how-tos/guestnet.html) - 20230214

