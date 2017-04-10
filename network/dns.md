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

Unfinished list based on [this result](https://duckduckgo.com/?q=free+and+uncensored+dns+server&ia=answer&iax=1)

|| provider name || ip v4 || ip v6 ||
| Alternate DNS | 198.101.242.72 | |
| | 198.101.242.72 | |
| BlockAid Public Dns | 205.204.88.60 | |
| | 178.21.23.150 | |
| Censurfridns | 91.239.100.100 | 2001:67c:28a4:: |
| | 89.233.43.71 | 2002:d596:2a92:1:71:53:: |
| CCC Berlin | 213.73.91.35 | |
| Christoph Hochstätter | 209.59.210.167 | |
| | 85.214.117.11 | |
| ClaraNet | 212.82.225.7 | |
| | 212.82.226.212 | |
| Comodo Secure DNS | 8.26.56.26 | |
| | 8.20.247.20 | |
| DNS.Watch | 84.200.69.80 | 2001:1608:10:25::1c04:b12f |
| | 84.200.70.40 | 2001:1608:10:25::9249:d69b |
| DNSReactor | 104.236.210.29 | |
| | 45.55.155.25 | |
| Dyn | 216.146.35.35 | |
| | 216.146.36.36 | |
| FDN | 80.67.169.12 | 2001:910:800::12 |
| FoeBud | 85.214.73.63 | |
| FoolDNS | 87.118.111.215 | |
| | 213.187.11.62 | |
| FreeDNS | 37.235.1.174 | |
| | 37.235.1.177 | |
| Freenom World | 80.80.80.80 | |
| | 80.80.81.81 | |
| German Privacy Foundation e.V. | 87.118.100.175 | |
| | 94.75.228.29 | |
| | 85.25.251.254 | |
| | 62.141.58.13 | |
| Google Public DNS (they record everything!) | 8.8.8.8 | 2001:4860:4860::8888 |
| | 8.8.4.4 | 2001:4860:4860::8844 |
| GreenTeamDNS | 81.218.119.11 | |
| | 209.88.198.133 | |
| Hurricane Electric | 74.82.42.42 | 2001:470:20::2 |
| Level3 | 209.244.0.3 | |
| | 209.244.0.4 | |
| Neustar DNS Advantage | 156.154.70.1 | |
| | 156.154.71.1 | |
| New Nations | 5.45.96.220 | |
| | 185.82.22.133 | |
| Norton DNS | 198.153.192.1 | |
| | 198.153.194.1 | |
| OpenDNS | 208.67.222.222 | 2620:0:ccc::2 |
| | 208.67.220.220 | 2620:0:ccd::2 |
| OpenNIC | 58.6.115.42 | 2001:470:8388:2:20e:2eff:fe63:d4a9 |
| | 58.6.115.43 | 2001:470:1f07:38b::1 |
| | 119.31.230.42 | 2001:470:1f10:c6::2001 |
| | 200.252.98.162 | |
| | 217.79.186.148 | |
| | 81.89.98.6 | |
| | 78.159.101.37 | |
| | 203.167.220.153 | |
| | 82.229.244.191 | |
| | 216.87.84.211 | |
| | 66.244.95.20 | |
| | 207.192.69.155 | |
| | 72.14.189.120 | |
| PowerNS | 194.145.226.26 | |
| | 77.220.232.44 | |
| SafeDNS | 195.46.39.39 | |
| | 195.46.39.40 | |
| SkyDNS | 193.58.251.251 | |
| SmartViper Public DNS | 208.76.50.50 | |
| | 208.76.51.51 | |
| ValiDOM | 78.46.89.147 | |
| | 88.198.75.145 | |
| Verisign | 64.6.64.6 | 2620:74:1b::1:1 |
| | 64.6.65.6 | 2620:74:1c::2:2 |
| Xiala.net | 77.109.148.136 | 2001:1620:2078:136:: |
| | 77.109.148.137 | 2001:1620:2078:137:: |
| Yandex.DNS | 77.88.8.88 | 2a02:6b8::feed:bad |
| | 77.88.8.2 | 2a02:6b8:0:1::feed:bad |
| puntCAT | 109.69.8.51 | 2a00:1508:0:4::9 |

## free dns

```
37.235.1.174
37.235.1.177
```

## dns.watch

```
84.200.69.80
84.200.70.40
2001:1608:10:25::1c04:b12f
2001:1608:10:25::9249:d69b
```

## censurfridns.dk

```
91.239.100.100
89.233.43.71
2001:67c:28a4::
2002:d596:2a92:1:71:53:
```

## ccc e.V.

```
213.73.91.35
194.150.168.168
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
    * https://servers.opennicproject.org/
* https://greycoder.com/list-uncensored-dns-providers/
* http://wiki.ipfire.org/en/dns/public-servers
