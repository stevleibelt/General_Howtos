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
```
