# Howto

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

[source](https://www.zabbix.com/forum/zabbix-help/49798-how-to-automatically-disable-special-triggers-from-discovery) - 20210803

### Links

* [Web Monitoring With ZABBIX Explained](https://www.youtube.com/watch?v=L_J56StHHbg) - 20210617
* [9. Web monitoring](https://www.zabbix.com/documentation/current/manual/web_monitoring) - 20210617
* [Monitoring WebSite with Zabbix](https://sysadminwork.com/monitoring-website-with-zabbix/) - 20200612
