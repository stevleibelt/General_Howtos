# Ubiquiti Networks / AirOS

## SNMP

* Ubiquiti supports SNMP version one
* Test: `snmpwalk -c public -v 1 <ip address of the device>`
* You can configure it
    * via the webinterface under `System`
    * via ssh
        * `vi /tmp/system.cfg`
        * search and change for following values
            * `snmp.status=enabled`
            * `snmp.community=public`
            * `snmp.contact=root@toor.su`
            * `snmp.location=[50.9128283, 13.341727]`

# Links

* [Configure AirOS SNMP settings over ssh](https://www.incredigeek.com/home/configure-airos-snmp-settings-over-ssh/) - 20190524
