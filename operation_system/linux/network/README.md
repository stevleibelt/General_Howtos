# List Available Devices

```
ls /sys/class/net
ip link show
```

# List Process For Port 80

```
lsof -i :80
netstat -tulpn | grep 80
```

# Scan All Open Ports On Your Local Machine

```
nmap -T Aggressive -A -v 127.0.0.1 -p 1-65000
netstat --tcp --udp --listening --program
lsof +M -i4
```

# Links

* https://wiki.archlinux.org/index.php/Network
* http://www.debian-administration.org/articles/184
* http://www.garron.me/en/go2linux/which-service-or-program-listening-port.html
