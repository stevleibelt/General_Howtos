# set it in /etc/ntpd.conf

## set servers (depending on your country)

```
[your router like "server fritz.box"]
server 0.de.pool.ntp.org
server 1.de.pool.ntp.org
server 2.de.pool.ntp.org
server 3.de.pool.ntp.org
```

## set pool (depending on your country)

```
servers de.pool.ntp.org
```

# see output

```
ntpdc -p
```

# set hardware clock

```
hwclock --systohc
```

# links

* http://www.debianadmin.com/ntp-server-and-client-configuration-in-debian.html
* http://www.cyberciti.biz/faq/debian-ubuntu-linux-install-ntpd/
