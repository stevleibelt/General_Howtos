# Netstat

## Usage

```bash
# Grep useful information about one ip address
netstat -nat | grep <ip address>
#netstat -nat |grep {IP-address} | awk '{print $6}' | sort | uniq -c | sort -n

# Find listening network ports
netstat -tulpen
#or if you are searching for a specific process like stuff from samba
netstat -tulpen | grep 'samba\|smbd\|nmbd\|winbind'
#or
netstat -lntu

# List used gateways
netstat -rn
```

## Examples

```bash
# Show tcp ports
netstat --all --tcp
#_or
netstat -at

# Show udp ports
netstat --all --udp
#_or
netstat -au

# Show all listening tcp and udp ports with process id and ip address
netstat --tcp --udp --listening --programs --numeric
```

## Links

* http://www.cyberciti.biz/tips/netstat-command-tutorial-examples.html
