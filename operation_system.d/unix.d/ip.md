# ip

## Example usage

```bash
# display information about all network interfaces
ip a
# show systems routing table
ip r

# assign temporary ip address
#   changes will last until next reboot or reset of the interface
#   it is ok and valid to assign multiple address to one device
ip addr add 192.168.3.100/24 dev <string: interface_name>
ip route del default
ip route add default via 192.168.3.1

# bo: setup a bridge temporary
brctl addbr <string: bridge_name=br0>
brctl addif <string: bridge_name=br0> <string: interface_name>
ip addr add 192.168.3.100/24 dev <string: bridge_name=br0>
ip link set <string: bridge_name=br0> up
# eo: setup a bridge temporary
```
