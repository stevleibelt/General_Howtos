# snmp

You need to install `net-snmp` to use the following commands.

## Create configuration files

```
cd /etc/snmp
snmpconfi
```

## Display available data per device

```
#dump numeric OIDs for snmp 1
#   -t 20: 20 seconds timeout
#   -v 1: use snmp version 1
#   -O fn: use display OIDs formatted numeric
#   -c public: use snmp community public
snmpwalk -t 20 -v 1 -O fn -c public <ip address of a switch or network device>

#dump OIDs for snmp 2
snmpwalk -t 20 -v 2c -c public <ip address of a switch or network device>
```

# Switch specific

* Cisco
    * `Admin interface` -> `Security` -> `TCP/UDP Services` -> `SNMP Service` Enable -> `Apply`

# Links

* [snmpd configuration](http://www.net-snmp.org/wiki/index.php/TUT:snmpd_configuration)
* [Netdata snmp data collector.](https://learn.netdata.cloud/docs/agent/collectors/node.d.plugin/snmp/#data-collection-speed)
