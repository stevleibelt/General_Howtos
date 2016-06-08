# how to install

```
#download and untar
LOCAL_TEMPORARY_BUILD_DIRECTORY="<replace with your temporary directory>"

cd "$LOCAL_TEMPORARY_BUILD_DIRECTORY"
wget http://www.noip.com/client/linux/noip-duc-linux.tar.gz
tar -xzf noip-duc-linux.tar.gz
cd noip-*
make
sudo make install
cd ..
rm -fr "$LOCAL_TEMPORARY_BUILD_DIRECTORY"
```

# enable automatic start on each boot

## system V

```
sudo echo '/usr/local/bin/noip2' >> /etc/rc.local
```

## systemd

```
#sudo su
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

chmod +x /etc/systemd/system/noip.service

systemctl daemon-reload

systemctl enable noip.service
systemctl start noip.service
```

# Solving problems

>>Can't get our visible IP address from ip1.dynupdate.no-ip.com

sudo iptables -t filter -A OUTPUT -o eth0 -p tcp --dport 8245 -j ACCEPT
or
sudo iptables -A OUTPUT -m state --state NEW -p tcp --dport 8245 -j ACCEPT

## Links

* https://wiki.archlinux.org/index.php/Raspberry_Pi
* https://www.linuxquestions.org/questions/linux-networking-3/no-ip-dns-updater-iptables-rules-757074/
* http://sorj.de/?p=72
