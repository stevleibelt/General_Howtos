# SSH Server section

## Recreate host ssh key on debian

```bash
sudo rm /etc/ssh/ssh_host_*
sudo dpkg-reconfigure openssh-server
sudo systemctl restart sshd.service
```

## List of option

All is done in dedicated `/etc/ssh/sshd_config.d/*.conf` files if not mentioned otherwise.
This way, `sshd_config` can be maintained by the package manager.

### Allow local user export variable

This can be useful if you have to share one account on a remote host.

As example, we are exporting a variable `MYCOMPANY_USER`. With this information on the remote host, each user can configure it's shell by adding a check in `~/.bashrc`.

```bash
AcceptEnv BAZZLINE_ENVIRONMENT
```

### Set ip address the demon is listen on

```bash
ListenAddress <ip-address>
```

### Restrict to local ip pool

#### Block everything from everyone.

```bash
echo 'ALL : ALL' > /etc/hosts.deny
```

#### Or block only all sshd conenctions

```bash
echo 'SSHD : ALL : DENY' > /etc/hosts.deny
```

#### Allow what we need

```bash
echo -e 'ALL : localhost\nsshd: <ip-address[with wildcards]>[\nanotherProgramm: <ip-address>]'

echo -e 'ALL : localhost\nsshd: 192.168.1.0'    #allow all from rane 192.168.1.x
```

#### Or

```bash
echo 'SSHD : <ipaddress> : ALLOW' > /etc/hosts.allow
```

### Root is not allowed to log in

```bash
PermitRootLogin no
```

### Allow only following users to log in

```bash
AllowUsers myUserOne[ myUserTwo]
```

### Allow only following groups to log in

```bash
AllowGroups myGroupOne[ myGroupTwo]
```

## Security advice

**Always** run `sshd -t` in test mode before restarting the service

`fail2ban` could be an option but it adds complexitiy and `yet another lines of code`.

```bash
# ref: https://wiki.archlinux.org/title/Google_Authenticator
# Has to be below the line UsePAM yes
PermitRootLogin no
AuthenticationMethods publickey,keyboard-interactive    #keyboard-interactive:pam only when you've setup google-authentication
KbdInteractiveAuthentication yes    #make your this line is commented out above
# deprecated since OpenSSH 6.2
#RSAAuthentication yes
#PasswordAuthentication no
#PubkeyAuthentication yes
```

### Terrapin attack

A [vulnerbility scanner](https://github.com/RUB-NDS/Terrapin-Scanner/releases/latest) is available.
Install it with `go install github.com/RUB-NDS/Terrapin-Scanner@latest`.
Use ist with `$HOME/go/bin/Terrapin-Scanner --connect localhost:22`

**Caution**, latest at 20240601, check if this is still needed

```bash
# Harden OpenSSH against Terrapin
# ref: https://staex.io/blog/terrapin-attack-on-ssh-what-do-you-need-to-know
# print effective ssh configuration and filter out affected ciphers
# '*-cbc' ciphers should be disabled by default
sshd -T | sed -nr 's/(chacha20-poly1305@openssh\.com,|,chacha20-poly1305@openssh\.com)//gip' >> /etc/ssh/sshd_config.d/terrapin-workaround.conf
```

## Hints

### Disable password login

```bash
/etc/ssh/sshd_config.d/disable-password-login.conf
PasswordAuthentication no
ChallengeResponseAuthentication no
```

### Enable logging

```bash
SyslogFacility AUTH
LogLevel DEBUG
#systemctl restart sshd.service
#journal -xfn | grep sshd
```

## Links

* [ssh keys](https://wiki.archlinux.org/index.php/SSH_Keys)
* [limit ssh acces by ip address](http://blog.serverbuddies.com/limit-ssh-access-by-ip-address/)

