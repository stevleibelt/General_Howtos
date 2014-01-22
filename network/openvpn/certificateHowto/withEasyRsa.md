# creation keys and certs with easy-rsa

cd
cp -r /usr/share/easy-rsa .
cd easy-rsa
vim vars
# set KEY_SIZE=4096
# adapt all others
source vars
./clean-all
./build-ca --pass
./build-key-server my-server
./build-dh
./build-key client-key # repeat until all client keys are generated
./build-key-pkcs12 client-key # repeat until all client keys are generated

cd keys
cp ca.crt ca.key dh4096.pem server.crt server.key /etc/openvpn/
openvpn --genkey --secret keys/ta.key

# links

* http://openvpn.net/index.php/open-source/documentation/howto.html#pki
