# IP

## Usage

```bash
# List default gateway
ip route show | grep default

# List all available information
ip a

# List address per device
ip addr list dev <device>

# Add IP-Address
ip addr add 1.2.3.4/24 dev <device>
#   with broadcast
ip addr add 1.2.3.4/24 brd 1.2.3.4 scope global dev <device>

# Remove IP-Address
ip addr del 1.2.3.4/24 dev <device>
```

## Debugging

```bash
#execute as root
ip monitor
```

## Links

* [Broadcast address is not needed by default.](https://serverfault.com/questions/460663/is-it-necessary-to-manually-set-the-interface-broadcast-address)
