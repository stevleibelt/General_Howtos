# how to install and setup hyperion

The following steps are based on that [howto](https://discourse.osmc.tv/t/hyperion-install-guide-on-osmc-tested-on-rc3/4719).

```
#login
ssh osmc@<your ip address>
sudo

#system maintenance
apt-get update
apt-get install git libqtcore4 libqtgui4 libqt4-network libusb-1.0-0 libprotobuf9 ca-certificates

#download and install hyperion
wget -N https://raw.github.com/tvdzwan/hyperion/master/bin/install_hyperion.sh
sh install_hyperion.sh

#enable GPIO
#ad following line if needed
dtparam=spi=on

#create your hyperion config
cp /usr/share/hyperion/config/hyperion.config.json.example /etc/hyperion/
vi /etc/hyperion/hyperion.config.json

cat > /etc/systemd/system/hyperion.service <<DELIM
[Unit]
Description=Hyperion
[Service]
Type=simple
#for kodi
#User=kodi
User=osmc
#for kodi
#Group=kodi
Group=osmc
UMask=007
#for kodi
#ExecStart=/usr/bin/hyperiond /etc/hyperion/hyperion.config.json
ExecStart=/opt/hyperion/bin/hyperiond /etc/hyperion.config.json
ExecReload=/bin/kill -HUP $MAINPID
Restart=on-failure
TimeoutStopSec=10
 
[Install]
WantedBy=multi-user.target
DELIM

systemctl daemon-reload
systemctl enable hyperion.service
systemctl start hyperion.service
```

# link

* https://github.com/hyperion-project/hyperion
