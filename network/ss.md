# General

`ss` supersedes `netstat`. `ss` kind of stands for `socket statistics`.

# More examples

```
#show tcp ports
ss --all --tcp
#_or
ss -at

#show udp ports
ss --all --udp
#_or
ss -au

#show all listening tcp and udp ports with process id and ip address
ss --tcp --udp --listening --numeric
```

# Links

* http://www.cyberciti.biz/tips/linux-investigate-sockets-network-connections.html
