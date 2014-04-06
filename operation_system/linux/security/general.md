# show failed logins

faillog -a

# get available services 

cat /etc/services | less

# scan (your local!) network for open ports

nmap -T Aggressive -A -v 127.0.0.1 -p 1-65000

# Setup Access Control

Adapt /etc/hosts.allow and /etc/hosts.deny

This is not supported by arch linux (https://www.archlinux.org/news/dropping-tcp_wrappers-support/).
Try to use a firewall instead (https://www.archlinux.org/packages/?q=firewall).

# disable X11 for other machines

By default, your xserver is listening on port 6000 (tcp).
By adding the following lines to your local configuration, you will stop your xserver from listening.

echo exec /usr/bin/X -nolisten tcp >> /etc/X11/xinit/xserverrc
echo exec xhosts +local: >> /etc/X11/xinit/xserverrc

You have to add " -- -nolisten tcp" into your xinitrc case block (where you call your windowmanager/desktop environment)

# print linked libaries

ldd /usr/bin/bash

# links

* http://www.farinspace.com/secure-login-linux-server/
* http://www.cyberciti.biz/tips/linux-how-do-i-display-failed-login-attempt.html
* https://www.linuxquestions.org/questions/linux-security-4/failed-ssh-login-attempts-340366/
* https://wiki.archlinux.org/index.php/Xinitrc