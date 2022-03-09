# Howto

## Setup updateable packages available

* The [zabbix-apt](https://github.com/theranger/zabbix-apt) package explains all
* Instead of apt, you could write your own configuration to fill up the parameters
* My improvement/change would be to move the logic a bit
    * The cronjob would become a systemd-timer
    * The systemd-service would execute a shell script
    * This shell script would generate up to two files
        * This is the script that contains the code for all supported package managers
            * On arch linux, for example, the code would be `sudo pacman -Syy && sudo pacman -Qu`
        * `/var/local/packagemanager-list_of_updateable_security_packages.txt` (e.g. via `apt-get -s upgrade | grep -ci ^inst.*security`)
        * `/var/local/packagemanager-list_of_updateable_packages.txt` (e.g. via `apt-get -s upgrade | grep -iPc '^Inst((?!security).)*$'`)
    * The zabbix agent conf file could be generalized
        * Rename `apt.conf` to `packagemanager.conf`
        * Rename `UserParameter=apt.security` to `UserParameter=packagemanager.security`
        * Rename `UserParameter=apt.updates` to `UserParameter=packagemanager.updates`
        * Change the way the `UserParameter` where filled by changing the command to something like `cat /var/local/packagemanager-list_of_updateable_packages.txt | wc -l`

## Setup web monitoring

* `Configuration` -> `Hosts` -> `Create host`
* Host Name: `<foo.bar.local>`
* Visible name: `[web]: foo.bar.local`
* `Create`
* Open this configuration again
* `Web scenarios` -> `Create web scenario`
    * Name: `<foo.bar.local>`
    * Update interval: `15m`
    * Attemps: `3-10`
    * Agent: `Zabbix`
    * Click on the `Steps` Tab
        * `Add`
        * Name: `<index page>`
        * URL: `https://foo.bar.local`
        * Required String: `<bazzline>`
        * Required status codes: `200`
* Test your step
    * `curl <url> | grep <string>`
    * if you have certificate that is not valid
        * `curl -k <url> | grep <string>`
* Check it: `Monitoring` -> `Hosts` -> `<foo.bar.local>` -> `Web` -> `<your web scenarion>`
    * Check the date
* Setup trigger/alert
    * `Configuration` -> `Hosts` -> `<foo.bar.local>` -> `Triggers` -> `Create Trigger`
    * Name `<foo.bar.local webpage>`
    * Serverity: `Warning`
    * Problem expression: `avg/<foo.bar.local>/web.test.fail[<foo.bar.local>],3)>=1`
    * OK event generation: `Recovery expression`
    * Recovery expression: `last/<foo.bar.local>/web.test.fail[<foo.bar.local>])=0`
    * Allow manual close: `check`
    * `Add`

## Setup apc/ups/usv

* Use [this](https://share.zabbix.com/power-ups/network-ups-generic) generic template
* or do it manually by following the next stemps
* login to zabbix as administrator
* `Configuration` -> `Hosts` -> `Create Host`
* [No template available](https://www.zabbix.com/de/integrations/apc_ups_snmp)
* Add the following Macros

| Name | Default Value | Description |
| --- | --- | --- |
| {$BATTERY.CAPACITY.MIN.WARN} | 50 | Minimum battery capacity percentage for trigger expression. |
| {$BATTERY.TEMP.MAX.WARN} | 55 | Maximum battery temperature for trigger expression. |
| {$SNMP.TIMEOUT} | 5m | The time interval for SNMP agent availability trigger expression. |
| {$TIME.PERIOD} | 15m | Time period for trigger expression. |
| {$UPS.INPUT_FREQ.MAX.WARN} | 50.3 | Maximum input frequency for trigger expression. |
| {$UPS.INPUT_FREQ.MIN.WARN} | 49.7 | Minimum input frequency for trigger expression. |
| {$UPS.INPUT_VOLT.MAX.WARN} | 243 | Maximum input voltage for trigger expression. |
| {$UPS.INPUT_VOLT.MIN.WARN} | 197 | Minimum input voltage for trigger expression. |
| {$UPS.OUTPUT.MAX.WARN} | 80 | Maximum output load in % for trigger expression. |

## Remove `OneSyncSvc_` not running from windows auto discovery

* login to zabbix as administrator
* `Configuration` -> `Templates`
* Insert `Windows service` in the name section and click on `Apply`
* Choose your fitting servce (e.g. `Template Module Windows services by Zabbix agent active`)
* Click on `Discovery rules`
* Select `Windows service discovery`
* Select `Filters`
* Click on `Add`
* Insert into `Macro` -> `{#SERVICE.NAME}`
* Select `does not match`
* Insert into `Regular expression` -> `OneSyncSvc_`
* Click on `Update`
* You need to delete the host and create it again to let the discovery process do its job
* Clock on `Administration` -> `General` -> `Regular expressions` -> `Windows service names for discovery`
* insert `|OneSyncSvc`

### Links

* [9. Web monitoring](https://www.zabbix.com/documentation/current/manual/web_monitoring) - 20210617
* [How to automatically disable special triggers from discovery](https://www.zabbix.com/forum/zabbix-help/49798-how-to-automatically-disable-special-triggers-from-discovery) - 20210803
* [Monitoring WebSite with Zabbix](https://sysadminwork.com/monitoring-website-with-zabbix/) - 20200612
* [Web Monitoring With ZABBIX Explained](https://www.youtube.com/watch?v=L_J56StHHbg) - 20210617
* [Zabbix Monitoring – Simple Check, Agent, SNMP](https://www.itnotes.it/linux/zabbix-monitoring/) - 20190827
