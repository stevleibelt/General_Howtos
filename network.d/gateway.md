# add default gateway

```
#make sure you have deleted the existing default gateway already
#by using route
route add default gw <ip address>
#by using ip
#ip route add 1.2.3.4/24 dev eth0
ip route add <ip address>/<netmask> dev <device>
```

# list current gateway

```
route -n
#or
ip route list
```

# grep default gateway with ip address

```
ip route | grep default
```

# route flags

```
U (route is up)
H (target is a host)
G (use gateway)
R (reinstate route for dynamic routing)
D (dynamically installed by daemon or redirect)
M (modified from routing daemon or redirect)
A (installed by addrconf)
C (cache entry)
!  (reject route)
```
