# Network analysis

## arp

See [Windows: ARP Command – Show Table & Clear Cache](https://www.shellhacks.com/windows-arp-command-show-table-clear-cache/) (20210621).

```
#show arp table
arp -a

#show arp table verbose
arp -av

#clear ARP cache
arp -d
```

## routing

See [Windows: Show Routing Table – Route Print](https://www.shellhacks.com/windows-show-routing-table-route-print/) (20210621).

```
#show all routes
route print

#show all ip v4 routes
route print -4

#show all ip v6 routes
route print -6

#show only routes for a subnet
route print 10*
```
