# DNS

## Determine current DNS server

```bash
nslookup www.bazzline.net | grep "Server:"
```

## How to set a DNS server

```bash
#add an entry starting with "nameserver <ip address>"
#sudo vim /etc/resolv.conf
#or simple add a line to the end
sudo echo "nameserver <ip address>" >> /etc/resolv.conf
```

## Free DNS server

Unfinished list based on [this result](https://duckduckgo.com/?q=free+and+uncensored+dns+server&ia=answer&iax=1) or [here](https://www.privacy-handbuch.de/handbuch_93d.htm).

| provider name | ip v4 | ip v6 | inserted at |
| --- | --- | --- | --- |
| Freifunk München  | 5.1.66.255 | 2001:678:e68:f000:: | 20220304 |
| | 185.150.99.255 | 2001:678:ed0:f000:: | 20220304 |
| Digitale Gesellschaft (CH) | 185.95.218.42 | 2a05:fc84::42 | 20220304 |
| | 185.95.218.43 | 2a05:fc84::43 | 20220304 |
| Censurfridns Denmark | 91.239.100.100 | 2001:67c:28a4:: | 20220304 |
| | 89.233.43.71 | 2a01:3a0:53:53:: | 20220304 |
| dismail.de | 80.241.218.68 | 2a02:c205:3001:4558::1 | 20220304 |
| | 159.69.114.157 | 2a01:4f8:c17:739a::2 | 20220304 |
| dnsforge.de | 176.9.93.198 | 2a01:4f8:151:34aa::198 | 20220304 |
| | 176.9.1.117 | 2a01:4f8:141:316d::117 | 20220304 |
| lahDNS.com | 78.46.244.143 | 2a01:4f8:c17:ec67::1 | 20220304 |
| | 95.216.212.177 | 2a01:4f9:c010:43ce::1 | 20220304 |
| ADGuard (Mit Werbe- und Trackingfilter) | 94.140.14.14 | 2a10:50c0::ad1:ff | 20220304 |
| | 94.140.15.15 | 2a10:50c0::ad2:ff | 20220304 |
| ADGuard (ohne Filter) | 94.140.14.140 | 2a10:50c0::1:ff | 20220304 |
| | 94.140.14.141 | 2a10:50c0::2:ff | 20220304 |
| Mullvad DoT- und DoH-Server MIT Werbe- und Trackingfilter | 194.242.2.3, 193.19.108.3 | 2a07:e340::3 | 20220304 |
| Mullvad DoT und DoH-Server OHNE Werbe- und Trackingfilter | IPv4: 194.242.2.2, 193.19.108.2 | IPv6: 2a07:e340::2 | 20220304 |
| Alternate DNS | 198.101.242.72 | | 20150701 |
| | 198.101.242.72 | | 20150701 |
| BlockAid Public Dns | 205.204.88.60 | | 20150701 |
| | 178.21.23.150 | | 20150701 |
| Censurfridns | 91.239.100.100 | 2001:67c:28a4:: | 20150701 |
| | 89.233.43.71 | 2002:d596:2a92:1:71:53:: | 20150701 |
| CCC Berlin | 213.73.91.35 | | 20150701 |
| Christoph Hochstätter | 209.59.210.167 | | 20150701 |
| | 85.214.117.11 | | 20150701 |
| ClaraNet | 212.82.225.7 | | 20150701 |
| | 212.82.226.212 | | 20150701 |
| Comodo Secure DNS | 8.26.56.26 | | 20150701 |
| | 8.20.247.20 | | 20150701 |
| DNS.Watch | 84.200.69.80 | 2001:1608:10:25::1c04:b12f | 20150701 |
| | 84.200.70.40 | 2001:1608:10:25::9249:d69b | 20150701 |
| DNSReactor | 104.236.210.29 | | 20150701 |
| | 45.55.155.25 | | 20150701 |
| Dyn | 216.146.35.35 | | 20150701 |
| | 216.146.36.36 | | 20150701 |
| FDN | 80.67.169.12 | 2001:910:800::12 | 20150701 |
| FoeBud | 85.214.73.63 | | 20150701 |
| FoolDNS | 87.118.111.215 | | 20150701 |
| | 213.187.11.62 | | 20150701 |
| FreeDNS | 37.235.1.174 | | 20150701 |
| | 37.235.1.177 | | 20150701 |
| Freenom World | 80.80.80.80 | | 20150701 |
| | 80.80.81.81 | | 20150701 |
| German Privacy Foundation e.V. | 87.118.100.175 | | 20150701 |
| | 94.75.228.29 | | 20150701 |
| | 85.25.251.254 | | 20150701 |
| | 62.141.58.13 | | 20150701 |
| Google Public DNS (they record everything!) | 8.8.8.8 | 2001:4860:4860::8888 | 20150701 |
| | 8.8.4.4 | 2001:4860:4860::8844 | 20150701 |
| GreenTeamDNS | 81.218.119.11 | | 20150701 |
| | 209.88.198.133 | | 20150701 |
| Hurricane Electric | 74.82.42.42 | 2001:470:20::2 | 20150701 |
| Level3 | 209.244.0.3 | | 20150701 |
| | 209.244.0.4 | | 20150701 |
| Neustar DNS Advantage | 156.154.70.1 | | 20150701 |
| | 156.154.71.1 | | 20150701 |
| New Nations | 5.45.96.220 | | 20150701 |
| | 185.82.22.133 | | 20150701 |
| Norton DNS | 198.153.192.1 | | 20150701 |
| | 198.153.194.1 | | 20150701 |
| OpenDNS | 208.67.222.222 | 2620:0:ccc::2 | 20150701 |
| | 208.67.220.220 | 2620:0:ccd::2 | 20150701 |
| OpenNIC | 58.6.115.42 | 2001:470:8388:2:20e:2eff:fe63:d4a9 | 20150701 |
| | 58.6.115.43 | 2001:470:1f07:38b::1 | 20150701 |
| | 119.31.230.42 | 2001:470:1f10:c6::2001 | 20150701 |
| | 200.252.98.162 | | 20150701 |
| | 217.79.186.148 | | 20150701 |
| | 81.89.98.6 | | 20150701 |
| | 78.159.101.37 | | 20150701 |
| | 203.167.220.153 | | 20150701 |
| | 82.229.244.191 | | 20150701 |
| | 216.87.84.211 | | 20150701 |
| | 66.244.95.20 | | 20150701 |
| | 207.192.69.155 | | 20150701 |
| | 72.14.189.120 | | 20150701 |
| PowerNS | 194.145.226.26 | | 20150701 |
| | 77.220.232.44 | | 20150701 |
| SafeDNS | 195.46.39.39 | | 20150701 |
| | 195.46.39.40 | | 20150701 |
| SkyDNS | 193.58.251.251 | | 20150701 |
| SmartViper Public DNS | 208.76.50.50 | | 20150701 |
| | 208.76.51.51 | | 20150701 |
| ValiDOM | 78.46.89.147 | | 20150701 |
| | 88.198.75.145 | | 20150701 |
| Verisign | 64.6.64.6 | 2620:74:1b::1:1 | 20150701 |
| | 64.6.65.6 | 2620:74:1c::2:2 | 20150701 |
| Xiala.net | 77.109.148.136 | 2001:1620:2078:136:: | 20150701 |
| | 77.109.148.137 | 2001:1620:2078:137:: | 20150701 |
| Yandex.DNS | 77.88.8.88 | 2a02:6b8::feed:bad | 20150701 |
| | 77.88.8.2 | 2a02:6b8:0:1::feed:bad | 20150701 |
| puntCAT | 109.69.8.51 | 2a00:1508:0:4::9 | 20150701 |

### DNS4EU

ref: https://www.joindns4.eu/

| IP Address | Comment |
| --- | --- |
| 86.54.11.1 | Protective Resolution |
| 86.54.11.12 | Protective + Child Protection |
| 86.54.11.13 | Protective + Ad blocking |
| 86.54.11.11 | Protective + Child Protection + Ad blocking |
| 86.54.11.100 | Unfiltered Resolution |

### Free DNS

```bash
37.235.1.174
37.235.1.177
```

### DNS.watch

```bash
84.200.69.80
84.200.70.40
2001:1608:10:25::1c04:b12f
2001:1608:10:25::9249:d69b
```

### Censurfridns.dk

```bash
91.239.100.100
89.233.43.71
2001:67c:28a4::
2002:d596:2a92:1:71:53:
```

### CCC e.V.

```bash
213.73.91.35
194.150.168.168
204.152.184.76 (f.6to4-servers.net, ISC, USA)
2001:4f8:0:2::14 (f.6to4-servers.net, IPv6, ISC)
194.150.168.168 (dns.as250.net; anycast DNS!)
213.73.91.35 (dnscache.berlin.ccc.de)
80.237.196.2
194.95.202.198
```

### Germany privacy foundation

```bash
87.118.100.175
62.141.58.13
87.118.104.203
85.25.251.254
94.75.228.29
```

### Digital courage e.V. 

```bash
85.214.73.63
```

### Opennic

```bash
109.69.8.34 (ns1.bcn.es) -- 98.73% uptime
192.71.245.208 (ns1.it) -- 99.50% uptime
41.185.78.25 (ns1.wc.za) -- 93.24% uptime
193.182.144.144 (ns1.ta.il) -- 98.11% uptime
```

## Other DNS server

### Opendns

```bash
208.67.222.222
208.67.220.220
```

### Google

```bash
8.8.8.8
8.8.4.4
```

### Local dns caches

* [dnsmasq](https://wiki.archlinux.org/index.php/Dnsmasq#Caching_DNS_server)
* [unbound](https://wiki.archlinux.org/index.php/Unbound)

## Links

* [free and not logging dns servers - kuketz-blog.de](https://www.kuketz-blog.de/empfehlungsecke/#dns)
* [openresolve](http://roy.marples.name/projects/openresolv/wiki?name=config)
* [dnsmasq](http://www.thekelleys.org.uk/dnsmasq/doc.html)
* [unbound](https://unbound.net/)
* http://www.fixmbr.de/opendns-und-andere-freie-dns-server/
* http://www.dmoz.org/Computers/Internet/Protocols/DNS/Service_Providers/
* https://www.opennicproject.org/
    * https://servers.opennicproject.org/
* https://greycoder.com/list-uncensored-dns-providers/
* http://wiki.ipfire.org/en/dns/public-servers
