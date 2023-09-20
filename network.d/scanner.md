# General

All you need is a SANE scanserver

# Configuration

## Server

```
vim /etc/sane.d/saned.conf
#required
localhost
#allow local subnet
192.168.0.0/24
#enable
systemctl enable saned.socket
```

## Client

```
vim /etc/sane.d/net.conf
#static IP address
<ip address>
#or host name
<host name>
```

# Link

* german
    * [Scannen im allgemeinen](https://wiki.ubuntuusers.de/Scanner/)
    * [SANE-Scanserver im Netzwerk](https://wiki.ubuntuusers.de/SANE-Scanserver_im_Netzwerk/)
    * [Scan Software](https://wiki.ubuntuusers.de/Scanner/Software/)
* english
    * [how to share a scanner in the network](https://www.linux.com/news/how-share-scanner-your-network)
    * [SANE](https://wiki.archlinux.org/index.php/SANE)
