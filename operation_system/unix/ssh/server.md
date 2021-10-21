# recreate host ssh key

```
sudo rm /etc/ssh/ssh_host_*
#for debian
sudo dpkg-reconfigure openssh-server
sudo systemctl restart sshd.service
```

# list of option

## set ip address the demon is listen on

```
ListenAddress <ip-address>
```

## restrict to local ip pool

### Block everything from everyone.

```
echo 'ALL : ALL' > /etc/hosts.deny
```

### Or block only all sshd conenctions

```
echo 'SSHD : ALL : DENY' > /etc/hosts.deny
```

### Allow what we need

```
echo -e 'ALL : localhost\nsshd: <ip-address[with wildcards]>[\nanotherProgramm: <ip-address>]'

echo -e 'ALL : localhost\nsshd: 192.168.1.0'    #allow all from rane 192.168.1.x
```

### or

```
echo 'SSHD : <ipaddress> : ALLOW' > /etc/hosts.allow
```

## root is not allowed to log in

```
PermitRootLogin no
```

## allow only following users to log in

```
AllowUsers myUserOne[ myUserTwo]
```

## allow only following groups to log in

```
AllowGroups myGroupOne[ myGroupTwo]
```

# security advice

```
PermitRootLogin no
PasswordAuthentication no
RSAAuthentication yes
PubkeyAuthentication yes
```

# hints

## disable password login

```
/etc/ssh/sshd_config
PasswordAuthentication no
ChallengeResponseAuthentication no
```

## enable logging

```
SyslogFacility AUTH
LogLevel DEBUG
#systemctl restart sshd.service
#journal -xfn | grep sshd
```

# links

* [ssh keys](https://wiki.archlinux.org/index.php/SSH_Keys)
* [limit ssh acces by ip address](http://blog.serverbuddies.com/limit-ssh-access-by-ip-address/)
