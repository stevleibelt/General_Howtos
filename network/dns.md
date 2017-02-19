# determine current dns server

```
nslookup www.bazzline.net | grep "Server:"
```

# how to set a dns server

```
#add an entry starting with "nameserver <ip address>"
#sudo vim /etc/resolv.conf
#or simple add a line to the end
sudo echo "nameserver <ip address>" >> /etc/resolv.conf
```

# free dns server

## ccc e.V.

```
213.73.91.35
204.152.184.76 (f.6to4-servers.net, ISC, USA)
2001:4f8:0:2::14 (f.6to4-servers.net, IPv6, ISC)
194.150.168.168 (dns.as250.net; anycast DNS!)
213.73.91.35 (dnscache.berlin.ccc.de)
80.237.196.2
194.95.202.198
```

## germany privacy foundation

```
87.118.100.175
62.141.58.13
87.118.104.203
85.25.251.254
94.75.228.29
```

## digital courage e.V. 

```
85.214.73.63
```

## opennic

```
109.69.8.34 (ns1.bcn.es) -- 98.73% uptime
192.71.245.208 (ns1.it) -- 99.50% uptime
41.185.78.25 (ns1.wc.za) -- 93.24% uptime
193.182.144.144 (ns1.ta.il) -- 98.11% uptime
```

# other dns server

## opendns

```
208.67.222.222
208.67.220.220
```

## google

```
8.8.8.8
8.8.4.4
```

# links

* openresolve - http://roy.marples.name/projects/openresolv/wiki?name=config
* http://www.fixmbr.de/opendns-und-andere-freie-dns-server/
* http://www.dmoz.org/Computers/Internet/Protocols/DNS/Service_Providers/
* https://www.opennicproject.org/
