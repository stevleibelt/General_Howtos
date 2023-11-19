# Schedule wifi uptime and downtime

By using a cronjob, we define when to turn on and off the wireless.

## How to disable wifi at 22:00 and enable wifi at 06:00

```bash
crontab -e
#add the following lines
#disable wifi at 22:00
0 22 * * * wifi down >/dev/null 2>&1
#enable wifi at 06:00
0 6  * * * wifi up   >/dev/null 2>&1
```

## Links

* [OpenWRT: Disable WiFi at a given time](https://www.flofaber.com/openwrt-disable-wifi-at-given-time) - 20220524:T20:40:00
