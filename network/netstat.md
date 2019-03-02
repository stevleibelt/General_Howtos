# grep useful information about one ip address

```
netstat -nat | grep <ip address>
#netstat -nat |grep {IP-address} | awk '{print $6}' | sort | uniq -c | sort -n
``` 

# find listening network ports

```
netstat -tulpn
#or if you are searching for a specific process like stuff from samba
netstat -tulpn | grep 'samba\|smbd\|nmbd\|winbind'
#or
netstat -lntu
```

# list used gateways

```
netstat -rn
```

# links

* http://www.cyberciti.biz/tips/netstat-command-tutorial-examples.html
