# ExtremeSwitching

# HowTo

## ERS360

### How to enable SNMP community

* Login
* `Configuration` -> `Edit` -> `Snmp Server` -> `Host`
* Click on `Insert`
    * `DestinationAddress`: `<ip-address of the monitoring server>`
    * `Port`: `161`
    * `Type`: `inform`
    * `Version`: `SNMPv2c`
    * `SecurityName`: `public`
