# Xymon Monitor

Xymon is a client/server based monitoring system for monitoring networks and servers.

## Client

* On debian, install `xymon-client hobbit-plugins`
* Configuration is done in `/etc/xymon/clientlaunch.d` (see `README.md`)
  * Extension `*.cfg` are enabled if they contain an `#DISABLED`
  * Extension `*.cfg` are disabled if they contain a `DISABLED`
* Plugins are located in `/usr/lib/xymon/client/ext/`
  * The plugin `entropy` is a good one if you want to create your own plugin

## Links

* [Official Webpage](https://xymon.sourceforge.io/) - 20230213
  * [Manpages](https://xymon.sourceforge.io/xymon/help/manpages/) - 20230213
* [Xymon entry on ubuntuusers](https://wiki.ubuntuusers.de/Xymon/) - 20230213
* [Xymon entry on wikibooks.](https://en.wikibooks.org/wiki/System_Monitoring_with_Xymon) - 20230213

