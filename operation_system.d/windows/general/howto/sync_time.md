# Synchronize Time

There is a chance that windows won't be able to update its time with an ntp server.

German error description is: `Der Computer wurde nicht erneut synchronisiert, da keine Zeitdaten verfügbar waren.`

## fetch current information

```
w32tm /query /status
```

## basic fixes

```
# stop time service
net stop w32time

# remove and add service
w32tm /unregister
w32tm /register

# start time service
net start w32time

# trigger a resync
w32tm /resync
```

## advanced fixes

```
net stop w32time

# reset local time
w32tm /config /update

# discover existing ntp servers and try to synchronize with them
w32tm /resync /rediscover

# if this is still not working, try to set your own ntp servers

w32tm /config /manualpeerlist:"<ip address or hostname of ntp server>[ <ip address or hostname of ntp server]>" /syncfromflags:manual /reliable:yes /update

net start w32time
```

# link

* [Liste der Windows-eigenen Kommandos - w32tm](https://www.axel-hahn.de/batch/helferlein-und-tabellen/alle-windows-kommandos?id=w32tm) - 20210216
* [Windows 10: Probleme mit der Zeitsynchronisation – Teil 1](https://www.borncity.com/blog/2019/02/25/windows-10-probleme-mit-der-zeitsynchronisation/) - 20190225
