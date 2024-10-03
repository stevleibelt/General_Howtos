# NTPD

## Setup

```bash
/etc/ntpd.conf
# Set servers (depending on your country)
[your router like "server fritz.box"]
server 0.de.pool.ntp.org
server 1.de.pool.ntp.org
server 2.de.pool.ntp.org
server 3.de.pool.ntp.org

# Set pool (depending on your country)
servers de.pool.ntp.org
```

### See output

```bash
ntpdc -p
```

### Set hardware clock

```bash
hwclock --systohc
```

### Check current time

```bash
nc fish.mirbsd.org daytime
```

## Links

* http://www.debianadmin.com/ntp-server-and-client-configuration-in-debian.html
* http://www.cyberciti.biz/faq/debian-ubuntu-linux-install-ntpd/
