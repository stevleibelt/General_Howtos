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

### Links

* [Web Monitoring With ZABBIX Explained](https://www.youtube.com/watch?v=L_J56StHHbg) - 20210617
* [9. Web monitoring](https://www.zabbix.com/documentation/current/manual/web_monitoring) - 20210617
