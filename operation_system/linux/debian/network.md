# dns/nameserver

    vim /etc/resolv.conf

    domain foo.bar
    search foo.bar
    nameserver <ip address>
    nameserver <an other ip address>

# static ip

    vim /etc/resolv.conf

    #loopback
    auto lo #auto up on start
    iface lo inet loopback

    #first interface
    auto eth0

    iface eth0 inet static
    address 192.168.1.118  

    gateway 192.168.1.1

    netmask 255.255.255.0
    network 192.168.1.0
    broadcast 192.168.1.255

# links

* [static ips in debian](http://www.techiecorner.com/486/how-to-setup-static-ip-in-debian/)
* [static ip address tutorial](http://www.cyberciti.biz/faq/linux-configure-a-static-ip-address-tutorial/)
