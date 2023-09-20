# installation

sudo pacman -S openvpn easy-rsa
cd /usr/share/openvpn/examples
cp server.conf /etc/openvpn/server.conf
echo '# load tun.ko at boot' > /etc/modules-load.d/tun.conf
echo 'tun' >> /etc/modules-load.d/tun.conf

# tun or tab

* tun device is for adding a pc to a network
* tab device is for adding a network to a network (via a pc acting as switch)

# start

openvpn --config /etc/openvpn/server.conf --tls-server --daemon

# simple server config (for point to multipoint modus)

```
port 1194
proto udp
dev tun0
mode server
server 10.8.0.0 255.255.255.0
client-config-dir /etc/openvpn/ip/ # adds fixed ips per client
```

# Examples

## Connect to an openvpn server via HTTP Proxy

```
#server
protp tcp

#client
http-proxy <ip address> <port>
```

# links

* [Step 1 - Install OpenVPN on your Linux PC](https://opensource.com/article/21/7/openvpn-router) - 20210804
* [Step 2 - Configure your OpenVPN server on Linux](https://opensource.com/article/21/7/openvpn-firewall) - 20210805
* [Step 3 - Access OpenVPN from a client computer](https://opensource.com/article/21/7/openvpn-client) - 20210806
* [Building A Raspberry Pi VPN Part One: How And Why To Build A Server](https://readwrite.com/2014/04/10/raspberry-pi-vpn-tutorial-server-secure-web-browsing/) - 20140414
* [docker image: kylemanna/openvpn](https://hub.docker.com/r/kylemanna/openvpn/) - 20181109
* [docker image: linuxserver/openvpn-as](https://hub.docker.com/r/linuxserver/openvpn-as/) - 20181109
* [OpenVPN IPv6 minimal configuration](https://4sysops.com/archives/openvpn-ipv6-minimal-configuration/) - 20210302
* [PiVPN](http://www.pivpn.io/) - 20190324
* https://www.digitalocean.com/community/tutorials/how-to-set-up-an-openvpn-server-on-ubuntu-14-04
* http://n0where.net/openvpn-raspberry-pi/
* http://raspberrypihelp.net/tutorials/1-openvpn-server-tutorial
* http://raspberrypi-hacks.com/29/turn-your-raspberry-into-an-openvpn-vpn-server/
* http://openvpn.net/index.php/open-source/documentation/howto.html
* http://openvpn.net/index.php/open-source/faq.html
* http://nyxbox.com/openvpn-on-raspberry-pi/
* http://blog.remibergsma.com/2013/01/05/building-an-economical-openvpn-server-using-the-raspberry-pi/
* http://www.raspberrypi.org/phpBB3/viewtopic.php?f=36&t=21566
* https://wiki.archlinux.org/index.php/Create_a_Public_Key_Infrastructure_Using_the_easy-rsa_Scripts
* https://wiki.archlinux.org/index.php/Openvpn
* http://archlinuxarm.org/forum/viewtopic.php?f=30&t=5170
* http://www.pro-linux.de/artikel/2/1650/2,konfiguration-des-servers.html
* [arch linux wiki](https://wiki.archlinux.de/title/OpenVPN)
* [angristan/openvpn-install](https://github.com/Angristan/OpenVPN-install)

# books

* OpenVPN (dpunkt.verlag)
