# installation

sudo pacman -S openvpn easy-rsa
cd /usr/share/openvpn/examples
cp server.conf /etc/openvpn/server.conf
echo '# load tun.ko at boot' > /etc/modules-load.d/tun.conf
echo 'tun' >> /etc/modules-load.d/tun.conf

# creation keys and certs

cd
cp -r /usr/share/easy-rsa .
cd easy-rsa
vim vars
# set KEY_SIZE=4096
# adapt all others
source vars
./clean-all
./build-ca
./build-key-server my-server
./build-dh
./build-key client-key # repeat until all client keys are generated
./build-key-pkcs12 client-key # repeat until all client keys are generated

cd keys
cp ca.crt ca.key dh4096.pem server.crt server.key /etc/openvpn/
openvpn --genkey --secret keys/server.key

# server

## enable forwarding

echo 1 > /proc/sys/net/pv4/ip_forward

# tun or tab

* tun device is for adding a pc to a network
* tab device is for adding a network to a network (via a pc acting as switch)

# links

* http://openvpn.net/index.php/open-source/documentation/howto.html
* http://openvpn.net/index.php/open-source/faq.html
* http://nyxbox.com/openvpn-on-raspberry-pi/
* http://n0where.net/openvpn-raspberry-pi/
* http://raspberrypihelp.net/tutorials/1-openvpn-server-tutorial
* http://blog.remibergsma.com/2013/01/05/building-an-economical-openvpn-server-using-the-raspberry-pi/
* http://www.raspberrypi.org/phpBB3/viewtopic.php?f=36&t=21566
* https://wiki.archlinux.org/index.php/Create_a_Public_Key_Infrastructure_Using_the_easy-rsa_Scripts
* https://wiki.archlinux.org/index.php/Openvpn
* http://archlinuxarm.org/forum/viewtopic.php?f=30&t=5170
* http://raspberrypi-hacks.com/29/turn-your-raspberry-into-an-openvpn-vpn-server/
* http://www.pro-linux.de/artikel/2/1650/2,konfiguration-des-servers.html
