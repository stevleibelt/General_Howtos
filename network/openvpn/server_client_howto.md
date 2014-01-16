# creation keys and certs

## by hand

### root certificat

openssl req <certificate request> -newkey <type:keylength> -days <validity in days> -keyout <private certificate key> -out <certificate>
openssl req -x509 -newkey rsa:4096 -days 3650 -keyout root_certificate.key -out root.crt

### server certificate

openssl req -newkey <tye:keylength> -keyout <private certificate key> -out <certificate signing request>
openssl req -newkey rsa:4096 -keyout server_one.key -out server_one.csr

## easy-rsa

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
