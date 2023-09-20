# snmp

You need to install `net-snmp` to use the following commands.

## Hardening

### Hardening snmp on debian based distributions

* Stop snmp service
  * `sudo systemctl stop snmp.service`
* If possible, disable snmp v1 and v2c
* Configure snmp v3
* Open `/etc/snmp/snmpd.conf`
* Comment out the following lines
  * `rocommunity`
  * `view`
  * `rouser authPriv`
* Create an snmp v3 user
  * `sudo net-snmp-create-v3-user -ro -a SHA-512 -x AES`
  * If you get an `cannot touch` error, add `rouser snmpuser` to the end of `/etc/snmp/snmpd.conf` by hand
* Adapt your firewall access by allowing `snmp` access via `UDP` on port `161`
* Start snmp service
  * `sudo systemctl start snmp.service`

### Hardening snmp on redhat based distributions

* Stop snmp service
  * `sudo systemctl stop snmp.service`
* If possible, disable snmp v1 and v2c
* Configure snmp v3
* Open `/etc/snmp/snmpd.conf`
* Comment out the following lines
  * Everything starting with `com2sec`
  * Everything starting with `group`
  * Everything starting with `access`
* Create an snmp v3 user
  * `sudo net-snmp-create-v3-user -ro -a SHA-512 -x AES`
* Adapt your firewall access by allowing `snmp` access via `UDP` on port `161`
* Start snmp service
  * `sudo systemctl start snmp.service`

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

## Switch specific

* Cisco
    * `Admin interface` -> `Security` -> `TCP/UDP Services` -> `SNMP Service` Enable -> `Apply`

## Links

* [snmpd configuration](http://www.net-snmp.org/wiki/index.php/TUT:snmpd_configuration)
* [Netdata snmp data collector.](https://learn.netdata.cloud/docs/agent/collectors/node.d.plugin/snmp/#data-collection-speed)
* [Snmpwalk Notes](https://utcc.utoronto.ca/~cks/space/blog/sysadmin/SnmpwalkNotes) - 20220404
* [Hardening SNMP on Debian](https://www.incredigeek.com/home/hardening-snmp-on-debian/) - 20220624T07:11:30

