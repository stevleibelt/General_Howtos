# Grep useful information about one ip address

```
netstat -nat | grep <ip address>
#netstat -nat |grep {IP-address} | awk '{print $6}' | sort | uniq -c | sort -n
``` 

# Find listening network ports

```
netstat -tulpen
#or if you are searching for a specific process like stuff from samba
netstat -tulpen | grep 'samba\|smbd\|nmbd\|winbind'
#or
netstat -lntu
```

# List used gateways

```
netstat -rn
```

# More examples

```
#show tcp ports
netstat --all --tcp
#_or
netstat -at

#show udp ports
netstat --all --udp
#_or
netstat -au

#show all listening tcp and udp ports with process id and ip address
netstat --tcp --udp --listening --programs --numeric
```

# links

* http://www.cyberciti.biz/tips/netstat-command-tutorial-examples.html
