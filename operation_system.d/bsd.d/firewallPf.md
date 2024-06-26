# Firewall Pf

```bash
#for testing, add following line to crontab
*/5 * * * * root /sbin/pfctl -d
#add to /etc/rc.conf
pf_enable="YES"
pf_rules="/etc/pf.conf"
pflog_enable="YES"
pflog_logfile="/var/log/pflog"

#file
/etc/pf.conf

#test file
pfctl -nf /etc/pf.conf

#terms
##makro
#a list of values represented by a name
tcp_pass = "{ 25 80 443 }";
##range
#a interval defined with a start and a end, separated with a >>:<< and represented by a name
tcp_pass = "{ 50000:52000 }"
#table
##can be defined dynamically and can contain single values or range expressions
##add persist if you want to keep the table even without having valid entries
table <mytable> [persist] { 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16, 224.0.0.0/5 }
##anchors
#is a placehold to load content dynamically
anchor myanchor
load anchor myanchor from "/path/to/pf_myrules"

#actions
##redirect
rdr
##block
block
##pass
pass
##translate internal packages to external
nat
##dont run through all rules
quick

#create a table ips with ! are excluded
table <tablename> { 192.168.0.0/24, !192.168.0.1 }

#test table
pfctl -t tablename -T show

#reload table while system is running
pfctl -t tablename -Tl -f /etc/pf.conf

#show status
pfctl -s info
#for each rule
pfctl -vs info
#show active rules
pcftl -s rules

#rules
##set "drop" (packages) as first rule
set block-policy drop
##skip all rules for loopback interface
set skip on lo0
##set a interface to log on (only one is allowed)
set loginterface re0
##example
##http://serverzeit.de/tutorials/firewall
### INTERFACES ###
if = "{ lo0, rl0 }"

### SETTINGS ###
set block-policy drop

### OFFENE TCP/UDP-PORTS ###
tcp_pass = "{ 53 2031 }"
udp_pass = "{ 53 2031 }"
icmp_types = "echoreq"

### NORMALISATION ###
scrub in all
antispoof for $if

### TABLES ###
table <intranet>   { 192.168.0.0/24 }
table <bruteforce> persist

### RULES ###
set skip on lo0
block all
block quick from <bruteforce>
pass in quick from <intranet> to any keep state
pass in on $if proto tcp from any to any port $tcp_pass flags S/SA keep state (max-src-conn 100, max-src-conn-rate 15/5, overload <bruteforce> flush global)
pass in on $if proto udp to any port $udp_pass keep state
pass out quick all keep state

# PING #
pass in on $if inet proto icmp all icmp-type $icmp_types keep state

# TRACEROUTE #
pass in on $if inet proto udp from any to any port 33433 >< 33626 keep state
```
