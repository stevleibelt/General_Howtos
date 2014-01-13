# block ip address

iptables -A INPUT -s <ip.address> -j DROP

# unblock ip address

iptables -D INPUT -s <ip.address> -j DROP

# block a port by ip address

iptables -A INPUT -s <ip.address> -p tcp --destination-port <port> -j DROP

# basic knowledge

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
* REJECT - rejection message is sent
* DROP - no rejection message is sent

# links

* http://www.cyberciti.biz/faq/how-do-i-block-an-ip-on-my-linux-server/
* https://wiki.archlinux.org/index.php/Iptables
