# How to section

## Read windows eventlog (german: Ereignisprotokoll)

!This is a work in progress!

Either I did something wrong or I am not patient enough to wait for data.

### Precondition

* Your windows host has a installed zabbix agent
* `zabbix_agentd.conf` has a configured `Server` and `ActiveServer` section
* The host is configured in your zabbix server

### Steps

* Open zabbix
* Go to `Configuration` -> `Hosts` -> select your host
    * `Applications` -> `Create application`
        * Name `Windows-Event-Log`
        * Click on `Add`
    * `Items` -> `Create item`
        * Name `Windows System.log`
        * Type `Zabbix agent (active)`
        * Key `eventlog[System,"Warning|Error|Critical",,,skip]` (see [here](https://www.zabbix.com/documentation/current/manual/config/items/itemtypes/zabbix_agent/win_keys) if you want to know more)
        * Typ of Information `Log`
        * Update interval `15s`
        * Storage periode `7d`
        * Application `Windows-Event-Log`
* Wait a bit
* `Monitoring` -> `Latest data` -> select your host -> search for `Windows System.log` -> click on `History`

### Links

* [Zabbix - Überwachen Sie das Ereignisprotokoll unter Windows](https://techexpert.tips/de/zabbix-de/zabbix-ueberwachen-sie-das-ereignisprotokoll-unter-windows/) - 20210415
* [Zabbix:Template Windows Eventlog](https://znil.net/index.php?title=Zabbix:Template_Windows_Eventlog) - 20150224
