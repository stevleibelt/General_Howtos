# Setup wireguard on Opnsense

## HowTo

* `System` -> `Firmware` -> `Plugins`
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

