download and untar
cd $directory
make
sudo make install

# sysV
sudo echo '/usr/local/bin/noip2' >> /etc/rc.local
# systemd
vim /etc/systemd/system/noip.service
>>[Unit]
Description=No-IP Dynamic DNS Update Client
After=network.target

[Service]
Type=forking
ExecStart=/usr/local/bin/noip2

[Install]
WantedBy=multi-user.target
<<

# Solving problems

>>Can't get our visible IP address from ip1.dynupdate.no-ip.com

sudo iptables -t filter -A OUTPUT -o eth0 -p tcp --dport 8245 -j ACCEPT

## Links

* https://www.linuxquestions.org/questions/linux-networking-3/no-ip-dns-updater-iptables-rules-757074/
