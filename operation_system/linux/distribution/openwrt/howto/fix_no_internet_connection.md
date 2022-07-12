# No internet connection

## Issue

Via `LuCI -> Network -> Diagnostics -> IPv4 Ping`: `ping: bad address 'openwrt.org'`.

Or via command line.

```
#traceroute to ip is working
traceroute 1.1.1.1
traceroute to 1.1.1.1 (1.1.1.1), 30 hops max, 46 byte packets
 1  192.168.179.1 (192.168.179.1)  4.407 ms  1.342 ms  1.181 ms
 2  88.71.57.132 (88.71.57.132)  1.547 ms !A  4.549 ms !A  1.553 ms !A

#nslookup is not working
nslookup google.com 1.1.1.1
;; connection timed out; no servers could be reached

#traceroute with domain is also not working
traceroute google.com
traceroute: bad address 'google.com
```

## Solution

```
#check if the right dns is there
uci show network | grep dns

#set the
```

## Information

If traceroute on an ip is working but nslookup with a specified dns is not working, there 
