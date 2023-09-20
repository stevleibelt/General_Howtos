# Share a (wifi-) internet connection through an ethernet adapter

## Mandatory preconditions

* Connected wireles network
* Existing ethernet adapter (if you are doing it via usb, you have to put in the usb-ethernet-adapter)
* `<string: ethernet_adapter>` is something like `enp0s25`
* `<string: connection_name>` is something like `wired_local_shared`

## Create a connection for your ethernet adapter

```bash
#ipv4.method shared results in
#   enabling ip forwarding for the interface
#   adds firewall rules and enables masquerading
#   starts dnsmasq as dhcp and dns server
nmcli connection add type ethernet ifname <string: ethernet_adapter> ipv4.method shared con-name <string: connection_name>
#note, you can use >>ipv6.method shared<< if you want to support ipv6

#check if the connection is active
nmcli device
```

## Change the shared ip range

```bash
#List configured ip range
ip -o addr show <string: ethernet_adapter>

#Change ip range
nmcli connection modify <string: connection_name> ipv4.addresses 192.168.42.1/24

#Activated changes
nmcli connection up <string: connection_name>
```

## Adding custom dnsmask options

This is totally optional and should not be needed for regular usage.

Open `/etc/NetworkManager/dnsmasq-shared.d/<string: my_file>.conf`

```bash
#tell dnsmasq to advertise this ntp server
dhcp-option=option:ntp-server,192.168.42.1
#tell dnsmasq to assign a static ip for this mac
dhcp-host=<string: mac_address_of_an_ethernet_adapter>,192.168.42.123
```

## Links

* [Internet connection sharing networkmanager](https://fedoramagazine.org/internet-connection-sharing-networkmanager/) - 20230130

