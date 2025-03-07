# Setup wireguard on Opnsense

## HowTo

### Create Wireguard local Server

* `VPN` -> `WireGuard` -> `Instances` (`https://<string: opnsense_ip>/ui/wireguard/general#instances`)
  * `+`
  * Enabled: yes
  * Name: `WG-Server`
  * Public key: Klick on the gear wheel to generate a new public and privat key
  * Listen port: `51820`
  * Tunnel address: `10.0.0.1/32`
  * `Save`

### Configure Wireguard Interface

* `Interfaces` -> `Assignments` (`https://<string: opnsense_ip>/interfaces_assign.php`)
* `+ Assign a new interface`
  * Device: Select your wireguard interface (`wg0`)
  * Description: `WG-Server`
  * `Add`
* Click on `WGServer`
  * Enable: yes

### Configure Firewall Settings

* `Firewall` -> `Rules` -> `WAN` (`https://<string: opnsense_ip>/firewall_rules.php?if=wan`)
* `+`
  * Action: `Pass`
  * Interface: `WAN`
  * Protocol: `UDP`
  * Source: `any`
  * Destination: `WAN address`
  * Destination port range: from `other` 51820
  * Destination port range: to `other` 51820
  * Description: `Pass Wireguard from WAN`
  * `Save`
  * `Apply changes`
* `Firewall` -> `Rules` -> `WGServer` (`https://<string: opnsense_ip>/firewall_rules.php?if=opt1`)
* `+`
  * Action: `Pass`
  * Interface: `WGServer`
  * Protocol: `any`
  * Source: `WireGuard (Group) net`
  * Destination: `any`
  * Description: `Pass WGServer from WireGuard (Group) net`
  * `Save`
  * `Apply changes`
* `Firewall` -> `Settings` -> `Normalization` (`https://<string: opnsense_ip>/firewall_scrub.php`)
* `+`
  * Interface: `WireGuard (Group)`
  * Description: `WireGuard Max mss`
  * Max mss: `1380`
  * `Save`
  * `Apply changes`
* `Firewall` -> `NAT` -> `Outbound` (`https://<string: opnsense_ip>/firewall_nat_out.php`)
* `+`
  * Interface: `WAN`
  * Source address: `WGServer net`
  * Destination address: `LAN net`
  * Translation / target: `Interface address`
  * Description: `WireGuard net to LAN net`
  * `Save`
  * `Apply changes`

### Configure Peers

* `VPN` -> `WireGuard` -> `Peer generator` (`https://<string: opnsense_ip>/ui/wireguard/general#configbuilder`)
* Instance: `WGServer`
* Endpoint: `my.dynamicdns.org:51820` (This is an example)
* Name: `My Phone`
* Address: `10.0.0.2/32`

----
* `System` -> `Firmware` -> `Plugins` (`https://<string: opnsense_ip>/ui/core/firmware#plugins`)
* Search for `os-wireguard`
* `VPN` -> `WireGuard` -> `Local` -> `+`
  * Name: `HomeWireGuard`
  * Listen Port: `51820`
  * Tunnel Address: `10.10.10.1/24`
  * `Save`
  * `Apply`
* `VPN` -> `WireGuard` -> `Endpoints` -> `+`
  * Name: `<string: user>_<string: device_name>`
  * Public Key: Generated it in your application
  * Allowed IPs: `10.10.10.2/32`
  * `Save`
* `VPN` -> `WireGuard` -> `Local`
  * `Edit` `HomeWireGuard`
  * Add previously created endpoint to peers
  * `Save`
* `VPN` -> `WireGuard` -> `General`
  * Enable WireGuard: `Check`
  * `Apply`
* `Interfaces` -> `Assignments`
  * `New Interface`
  * Select the wireguard interface (`wg1`)
  * Description: `HomeWireGuard`
  * `+`
  * `Save`
* `Interfaces` -> `HomeWireGuard`
  * Enable: `Check`
  * Lock: `Check`
  * `Save`
* `VPN` -> `WireGuard` -> `General`
  * Enable WireGuard: `Uncheck`
  * `Apply`
  * Enable WireGuard: `Check`
  * `Apply`
* `Services` -> `Unbound DNS` -> `General`
  * Restart service
* `Firewall` -> `NAT` -> `Outbound`
  * Mode: ` Hybrid outbound NAT rule generation`
  * `Save`
  * `Apply changes`
  * `+`
  * Interface: `WAN`
  * TCP/IP: `IPv4`
  * Protocol: `any`
  * Source address: `HomeWireGuard net`
  * Description: `wireguard_net_to_all`
  * `Save`
  * `Apply changes`
* `VPN` -> `WireGuard` -> `General`
  * Enable WireGuard: `Uncheck`
  * `Apply`
  * Enable WireGuard: `Check`
  * `Apply`
* `Firewall` -> `Rules` -> `WAN`
  * `+`
  * Protocol: `UDP`
  * Destination: `WAN address`
  * Destination port range: `from 51820 to 51820` (select `other`)
  * `Save`
  * `Apply changes`
* `Firewall` -> `Rules` -> `HomeWireGuard`
  * `+`
  * Source: `HomeWireGuard net`
  * `Save`
  * `Apply changes`

