# installation

sudo pacman -S openvpn easy-rsa
cd /usr/share/openvpn/examples
cp server.conf /etc/openvpn/server.conf

# creationg keys and certs

cd
cp -r /usr/share/easy-rsa .
cd easy-rsa
source vars
./clean-all
./build-ca
./build-key-server server
./build-dh
./build-key clientpi

# links

* http://nyxbox.com/openvpn-on-raspberry-pi/
* http://n0where.net/openvpn-raspberry-pi/
* http://raspberrypihelp.net/tutorials/1-openvpn-server-tutorial
* http://blog.remibergsma.com/2013/01/05/building-an-economical-openvpn-server-using-the-raspberry-pi/
* http://www.raspberrypi.org/phpBB3/viewtopic.php?f=36&t=21566
* https://wiki.archlinux.org/index.php/Create_a_Public_Key_Infrastructure_Using_the_easy-rsa_Scripts
* https://wiki.archlinux.org/index.php/Openvpn
