# setup ntp

As example by a switch located in Europe\Saxony\Freiberg in February.

```
telnet <ip address>

#select `configuration via cli`
configure

#set daylight-time-rule
time daylight-time-rule middle-europe-and-portugal

#set timezone
##caution, if it is summer time right now, you have to set 120 minutes
time timezone 60

#configure ntp
timesync ntp
ntp unicast

#set initial ntp server
ntp server <ip address>
##add additional ntp servers
[ntp server <ip address>]

#enable ntp
ntp enable

#check things
show time
show ntp status

#save it
write memory
```

# link

* [How to Really Set Up NTP on HP ProCurve / Aruba Switches – HP Networking Series Part 7](https://grumpytechie.net/2018/08/24/how-to-really-set-up-ntp-on-hp-procurve-aruba-switches-hp-networking-series-part-7/) - 20180824
* [How to: Setting up NTP on HP/Aruba Switches](https://community.spiceworks.com/how_to/133260-setting-up-ntp-on-hp-aruba-switches) - 20180326
