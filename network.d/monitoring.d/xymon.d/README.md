# Xymon Monitor

Xymon is a client/server based monitoring system for monitoring networks and servers.

## Client

* On debian, install `xymon-client hobbit-plugins`
* Client hostname is configured in `/etc/default/xymon-client`
* Configuration is done in `/etc/xymon/clientlaunch.d` (see `README.md`)
  * Extension `*.cfg` are enabled if they contain an `#DISABLED`
  * Extension `*.cfg` are disabled if they contain a `DISABLED`
* Plugins are located in `/usr/lib/xymon/client/ext/`
  * The plugins `entropy` or `ntqp` are good templates if you want to create your own plugin
* Plugins can have a central configuration file `/etc/xymon/plugins.yml`
  * Plugins can have a separate configuration file `/etc/xymon/my_plugin.yml`
  * Plugins can have a separate local configuration file `/etc/xymon/my_plugin.local.yml`
* Restart the client (trigger executing all test on the client)
  * `systemctl restart xymon-client.service`

## Links

* [Official Webpage](https://xymon.sourceforge.io/) - 20230213
  * [Manpages](https://xymon.sourceforge.io/xymon/help/manpages/) - 20230213
* [Xymon custom test client script template: github.com](https://github.com/OliverTUBAF/xymon-custom-test-client-script-template/tree/main) - 20231220
* [Xymon entry on ubuntuusers](https://wiki.ubuntuusers.de/Xymon/) - 20230213
* [Xymon entry on wikibooks.](https://en.wikibooks.org/wiki/System_Monitoring_with_Xymon) - 20230213

