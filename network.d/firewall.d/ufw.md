# ufw

Uncomplicated Firewall is a frontend for iptables.

## Setup / How to use it / Kickstart

### Installation

```bash
#install it
pacman -S ufw

#disable IPv6
# search for >>IPv6=yes<< and replace >>yes<< with >>no<<
vim /etc/default/ufw

#list all currently open ports

ss -nptl
```

### Add rule

```bash
#create rules before you enable it
##by using an alias (works only if you use the default port of the software)
ufw allow ssh
##or by using the direct port
ufw allow 22
##or by using the port and the protocol (this is the best)
ufw allow 22/tcp
```

### List rule

```bash
#you can also create a rule to close a open connection
#of course you can use the alias, just the port
ufw deny 22/tcp

#list all running rules
ufw status
```

### Delete rule

```bash
#remove all rules
ufw reset

#to ease up the deletion, we can add a number for each rule
ufw status numbered

#now we can delete it
ufw delete <int: number>

#but you can also delete by rule
ufw delete 22/tcp

#activate or deactivate
ufw enable
ufw disable
```

