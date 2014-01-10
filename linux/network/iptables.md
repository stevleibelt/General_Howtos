# block ip address

iptables -A INPUT -s <ip.address> -j DROP

# unblock ip address

iptables -D INPUT -s <ip.address> -j DROP

# block a port by ip address

iptables -A INPUT -s <ip.address> -p tcp --destination-port <port> -j DROP

# links

* http://www.cyberciti.biz/faq/how-do-i-block-an-ip-on-my-linux-server/
* https://wiki.archlinux.org/index.php/Iptables
