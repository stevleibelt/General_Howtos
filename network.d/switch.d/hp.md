# Models

## HP Switch 5412Rzl2 (J9851A)

### setup ntp

As example by a switch located in Europe\Saxony\Freiberg in February.

Use `?` in the commandline to get the help/available commands.
For subcommands, use `<subcommand> ?` to get the avalable help/commands.

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

## HP 5700 (JG898A)

It is hard to find good documentation for this switch.
It looks like it is a Comware OS.

### enable ntp usage

```
#login
system-view

#show current status
display ntp-service status

#show current session
display ntp-service sessions    #you can add >>verbose<<

#check current clock
display clock
```

### enable snmp

```
#login
system-view

#enable snmp agent
snmp-agent

#configure snmp information for device
##public is your community string
snmp-agent community read public

#enable snmp agent v2
snmp-agent sys-info version v2c

#enable snmp agent v3
snmp-agent sys-info version v3

#show current settings
display snmp-agent sys-info version

#save
save
```

# link

* [How to: Configure SNMPv3 with UP Comware](https://certifiedgeek.weebly.com/blog/configuring-snmpv3-with-hp-comware-part-1) - 20210225
* [How to: Really Set Up NTP on HP ProCurve / Aruba Switches – HP Networking Series Part 7](https://grumpytechie.net/2018/08/24/how-to-really-set-up-ntp-on-hp-procurve-aruba-switches-hp-networking-series-part-7/) - 20180824
* [How to: Setting up NTP on HP/Aruba Switches](https://community.spiceworks.com/how_to/133260-setting-up-ntp-on-hp-aruba-switches) - 20180326
* [Doc: HPE FlexFabric 5700 Switch Series - LED Indicators](https://support.hpe.com/hpesc/public/docDisplay?docLocale=en_US&docId=c04438848)
* [Doc: HPE FlexFabric 7900 Switch Series Network Management and MonitoringCommand Reference](https://techhub.hpe.com/eginfolib/networking/docs/switches/7900/5200-0987b_nmm_cr/content/index.htm) - 20210225
