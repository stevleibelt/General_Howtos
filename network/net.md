# retriev network device
lspci | grep -i net

# config lan
ifconfig

# config wlan
iwconfig

# bring interface up
ip ling set wlan0 up

# show status of current ling
iwlist wlan0 rate

# get used firmeware
dmesg | grep firmware

# scan for nearby ESSID
iwlist wlan0 scan

# use netctl

do not put your wifi in an "up" stage (ip link set wlan0 down), otherwise, no connection possible.

# connect with wpa
## backup current wpa file
mv /etc/wpa_supplicant.conf /etc/wpa_supplicatn.conf.original

## passphrase
wpa_passphrase linksys "my_super_secret_passkey" > /etc/wpa_supplicant.conf

# cli networkmanager
## starting services
start /etc/rc.d/dbus start and /etc/rc.d/networkmanager start

## show available connections
nmcli con list

## up con
nmcli con up id $NAME

# use dhcp
dhcpcd wlan0

# test connection
ping -c 3 www.google.de

# measure network connection speed
on server:
iperf -s -B <server ip address>

on client:
iperf -c <server ip address> -d -t 60 -i 10
