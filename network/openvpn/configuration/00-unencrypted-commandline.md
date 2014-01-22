# test simple and not encrypted tunnel between server and client

## on server

openvpn --dev tun0 --remote <client ip> --ifconfig <virtual server ip address> <virtual client ip address>

### example

openvpn --dev tun0 --remote 192.168.0.2 --ifconfig 10.8.0.1 10.8.0.2

## on client

openvpn --dev tun0 --remove <server ip> --ifconfig <virtual client ip address> <virtual server ip address>

### example

openvpn --dev tun0 --remote 192.168.0.1 --ifconfig 10.8.0.2 10.8.0.1
