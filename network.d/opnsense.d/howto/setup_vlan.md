# Setup VLAN on Opnsense

## HowTo

### Create VLANs

* `Interfaces` -> `Devices` -> `VLAN` (`https://<string: opnsense_ip>/ui/interfaces/vlan`)
* `+`
* Device: `vlan0.<int: number>[.<int: number>]`
* Parent: Choose your LAN or fitting parant interface
* VLAN tag: `<int: number>`
* Description: `vlan<int: tagnumber>_<string: human_readable_name>`

### Assign VLAN Interfaces

* `Interfaces` -> `Assignments` (`https://<string: opnsense_ip>/interface_assign.php`)
* `+ Assign a new interface`
* Click on fitting interface name
* `Add`
* Click on the interface in the `Interfaces: Assignments` table
  * Enable: yes
  * IPv4 Configuration Type: `Static IPv4`
  * IPv4 address: `192.168.10.1/24`
  * `Save`

### Configure DHCP for VLAN

* `Services` -> `ISC DHCPv4` (`https://<string: opnsense_ip>/ui/kea/dhcp/v4`)
* Select your interface
  * Enable: yes
  * Range: from `192.168.10.100` to `192.168.10.254`
  * Gateway: `192.168.10.1`
  * `Save`

### Configure Firewall Rules for VLAN

* `Service` -> `Firewall` -> Your VLAN Interface
* `+`
  * Action: `Pass`
  * Protocol: `any`
  * Source: `<string: vlan description> net`
  * Destination: `any`
  * `Save`
  * `Apply changes`

### Configure your switch

* For untagged (No VLAN)
  * Set the port to `untagged` or default VLAN (`VLAN 1`)
  * E.g. `switchport mode access` and `switchport access vlan None/0/1`
* For one VLAN 10
  * E.g. `switchport mode access` and `switchport access vlan 10`
* For multiple VLANs
  * E.g. `switchport mode access` and `switchport access vlan 10,20,30`
* For all VLANs
  * E.g. `switchport mode access` and `switchport access vlan all/1-4094`

## Links

* [Official documentation](https://docs.opnsense.org/manual/other-interfaces.html#vlan) - 20250203
