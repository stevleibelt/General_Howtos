# creation keys and certs

## by hand

### create root certificat

openssl req <certificate request> -newkey <type:keylength> -days <validity in days> -keyout <private certificate key> -out <certificate>
openssl req -x509 -newkey rsa:4096 -days 3650 -keyout root.key -out root.crt

### create server certificate request

openssl req -newkey <tye:keylength> -keyout <private certificate key> -out <certificate signing request>
openssl req -newkey rsa:4096 -keyout server_one.key -out server_one.csr

### prepare openssl

vim /etc/ssl/openssl.cnf

configure:
dir         #basedir
database    #index filre for certificates
serial      #serial number
certificate #path/to/root.crt
private_key #path/to/root.key

#### hint

add following entries also:
localityName_default            = Some-Locality
organizationalUnitName_default  = Some-Organizational
commonName_default              = Some-Name
emailAddress_default            = some@email.address

### sign server certificate request with root certificate

openssl ca -cert <master certificate> -keyfile <master certificate key> -out <certificate>  -in <certificate signing request>
openssl ca -cert root.crt -keyfile root.key -out server_one.crt -in server_one.csr

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

# links

* http://community.spiceworks.com/how_to/show/1469-how-to-become-your-own-certificate-authority-and-secure-spiceworks
* http://www.martinahrer.at/tag/linux/
