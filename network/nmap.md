# nmap

## "Ping" a port

```bash
nmap -p <int: port> <string: hostname_or_ip>
#alternativ
telnet <string: hostname_or_ip> <int: port>
```

## Scan your network

```bash
#nmap -v -sT 192.168.0.0/24
nmap -v -sT <network>/<mask>
```

## Links

* https://wiki.archlinux.org/index.php/Nmap
* https://nmap.org/
* https://en.wikipedia.org/wiki/Nmap
* http://www.cyberciti.biz/tips/linux-scanning-network-for-open-ports.html
* http://www.cyberciti.biz/networking/nmap-command-examples-tutorials/

