# List Available Devices

ls /sys/class/net
ip link show

# List Process For Port 80

lsof -i :80
netstat -tulpn | grep 80

# Links

* https://wiki.archlinux.org/index.php/Network
* http://www.debian-administration.org/articles/184
