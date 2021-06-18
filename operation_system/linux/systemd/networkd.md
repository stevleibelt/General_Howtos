# systemd-networkd

# Error solving

## "failed to save lldp data" permission denied

This has happend and solved until 2021-06-18.

The issue was a spam in the journal log full of `failed to save lldf data` with adapter specific parts followed by `permission denied`.   
Full disclosure, I do not understand how my changes had solved this bug. After searching a lot in the www, I have compared my existing interface configuration (path `/etc/systemd/network`) with others, added the following line to the file and restarted the `systemd-networkd.service` plus `systemd-networkd.socket`.

```
#/etc/systemd/network/you-nic.network
#add the following lines
[DHCP]
ClientIdentifier=mac
```

# Links

* [systemd home page](https://systemd.io/) - 20210618
* [systemd.network](https://www.freedesktop.org/software/systemd/man/systemd.network.html#) - 20210618
