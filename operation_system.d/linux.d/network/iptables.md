# list available policies and rules

    iptables -L
    iptables -nvL

## list available policies and rules per filter

    iptables -t <filter> -L

# remove all available policies and rules

    iptables -F

# restore from configuration file

    iptables-restore < /etc/iptables/iptables.rules

# save to configuration file

    iptables-save > /etc/iptables/iptables.rules

# block ip address

    iptables -A INPUT -s <ip.address> -j DROP

# unblock ip address

    iptables -D INPUT -s <ip.address> -j DROP

# block a port by ip address

    iptables -A INPUT -s <ip.address> -p tcp --destination-port <port> -j DROP

# basic knowledge

## parameters

* -t <table> (default is "filter")
* -P <chain> <target> (sets overall policy if no rule matches packet handling)
* -A <chain> (append rule to chain)
* -I <rule_number> <chain> (inserts an appended rule into a well defined location)
* -D <chain> <rule_number> (deletes a selected rule)
* -j <target> (if criteria is met, the firewall should jump to the target)
* -d <ip_address> (destination)
* -s <ip_address> (source)
* -p <protocol> (tcp, udp)
* --dport <port_number> (destination)
* --sport <port_number> (source)
* -m state --state <network_state> (state like RELATED, ESTABLISH)

## terms

* tables - sections for fitting packets / type of firewall
* chains - categories for network packets
* policies - ways of identifiyng what to do with that packet
* rules - targets used for packets 

### tables

* filter - table for packets filtering (packets to, from and through the system)
* nat - table for network address translation
* mangle - table for mangled (modified) packets used in nat
* raw - table for all the others (packets for "network tracking")
* security - table for SELinux driven systems (MAC rule based system used after filter (DAC rule based system) table)

### chains

* INPUT - packets comming into the system
* FORWARD - packets comming through the system (routed to destination)
* OUTPUT - packets comming from the system
* PREROUTING - (nat) packets for modifying comming into the system
* POSTROUTING - (nat) packets for modifying comming from the system

#### chains per table

* filter - INPUT, FORWARD, OUTPUT
* nat - PREROUTING, OUTPUT, POSTROUTING
* mangle - INPUT, FORWARD, PREROUTING, OUTPUT, POSTROUTING
* raw - PREROUTING, OUTPUT
* security - INPUT, FORWARD, OUTPUT

### policies

A packet can be identified by following (incomplete) list of policies:

* source ip
* destination ip
* network protocol
* inbout port
* outbound port
* network state

### rules

Based on the policy, following (incomplete) list of targets can be used:

* ACCEPT
* DROP - no rejection message is sent
* QUEUE
* RETURN
[target extensions]
* LOG
* REJECT - rejection message is sent

# example

## open ssh

    iptables -A INPUT -p tcp --dport 22 -j ACCEPT
    iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT

# links

* https://www.frozentux.net/iptables-tutorial/iptables-tutorial.html
* http://www.cyberciti.biz/faq/how-do-i-block-an-ip-on-my-linux-server/
* https://wiki.archlinux.org/index.php/Iptables
* http://wiki.centos.org/HowTos/Network/IPTables
* https://help.ubuntu.com/community/IptablesHowTo
* http://www.cyberciti.biz/faq/linux-open-iptables-firewall-port-22-23/
* http://www.cyberciti.biz/tips/linux-iptables-4-block-all-incoming-traffic-but-allow-ssh.html

# books

* Linux BIBLE - Eight Edition (wiley) page 710 ff
