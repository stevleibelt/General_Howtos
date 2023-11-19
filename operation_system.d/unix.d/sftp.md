# setup

## with chroot jail

Benefit here is to simple share some files without granting full system or shell access.

```
#create jail filesystem
mkdir -p /var/lib/jail/sftp
#you should consider setting the permissions to 0755
chown -R root:root /var/lib/jail
chmod -R 755 /var/lib/jail
#mount your data into it
mount -o bind /your/data/to/share /var/lib/jail/sftp
#create sshuser group if needed
groupadd sshusers
#create unprivileged user
useradd -g sshusers -d /var/lib/jail/sftp <username>
passwd <username>
#adapt sshd configuration
cat >>/etc/ssh/sshd_config<<DELIM
#bo handle users of group sshusers
Match group sshusers
    ChrootDirectory %h
    X11Forwarding no
    AllowTcpForwarding no
    PasswordAuthentication yes
    ForceCommand internal-sftp
#eo handle users of group sshusers
DELIM
#restart sshd service
systemctl restart sshd.service
```

## regular

* install openssh-server
* vim /etc/ssh/sshd_config
    * replace "Subsystem sftp /usr/lib/openssh/sftp-server" with "Subsystem sftp internal-sftp"
    * add to the end of the file
        Match User sftp
        ChrootDirectory /srv/sftp
        ForceCommand internal-sftp
* mkdir /srv/sftp
* useradd sftp -b /srv/sftp
* passwd sftp
* disable shell access
    usermod -s /bin/false sftp
    # or
    usermod -s /sbin/nologin sftp
    # add "/sbin/nologin" to your "/etc/shells"
* chown -hR root:sftp /srv/sftp
* chmod -hR 755 /srv/sftp
* mkdir /srv/sftp/upload
* chown -hR sftp:sftp /srv/sftp/upload
* chmod -hR 755 /srv/sftp
* restart ssh

# on errors

```
tail -f /var/log/auth.log
```

# links

* https://wiki.archlinux.org/index.php/SFTP_chroot
* http://nukular0815.blogspot.de/2011/03/debian-sftp-server-einrichten.html
* http://forum.ubuntuusers.de/topic/sftp-login-als-benutzer-fatal-bad-ownership-o/
