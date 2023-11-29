# netsh advFirewall

```
#show all available rules
netsh advFirewall Firewall show rule name=all 

#enable ping ip v4
netsh advFirewall Firewall add rule name="<your company> PING IPv4" protocol=icmpv4:8,any dir=in action=allow

#enable ping ip v6
netsh advFirewall Firewall add rule name="<your company> PING IPv6" protocol=icmpv6:8,any dir=in action=allow 

#disable ping ip v4
netsh advFirewall Firewall add rule name="<your company> PING IPv4" protocol=icmpv4:8,any dir=in action=block 

#disable ping ip v6
netsh advFirewall Firewall add rule name="<your company> PING IPv6" protocol=icmpv6:8,any dir=in action=block 
```

# links

* [How to enable and disable PING ICMP in Windows 10 Firewall](https://www.osradar.com/how-to-enable-and-disable-ping-icmp-in-windows-10-firewall/)
