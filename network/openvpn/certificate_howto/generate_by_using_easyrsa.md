# arch linux wiki way (2017-10-13

## create certificate authority (CA)

```
cd /etc/easy-rsa
export EASYRSA=$(pwd)
easyrsa init-pki
easyrsa build-ca
```

## create openvpn server files

```
cd /etc/easy-rsa
easyrsa init-pki
easyrsa gen-req <server name> nopass
cp /etc/easy-rsa/pki/private/<server name> /etc/openvpn/server

*
openssl dhparam -out /etc/openvpn/server/dh.pem 2048

openvpn --genkey --secret /etc/openvpn/server/ta.key
```

## create openvpn client files

```
################
# generating client specific files
################
#if not done yet on the client machine
cd /etc/easy-rsa
easyrsa init-pki

#client reqs/<client name>.req and private/<client name>.key in /etc/easy-rsa/pki/
easyrsa gen-req <client name> nopass

################
# signing the certificates
################
# scp the *.req files (server and clients) to the ca machine into a <working path>
cd /etc/easy-rsa
easyrsa import-req <your path>/<server file name>.req <server name>
# repeat the following line until you have loaded all clients
easyrsa import-req <your path>/<client file name>.req <client name>
#you are now creating one file per call in /etc/easy-rsa/pki/issued/<name>.crt
easyrsa sign-req server <server name>
#for each client name
easyrsa sign-req client <client name>
#copy the fitting file to the fitting machine

################
# updating the server
################
mv <certificate> /etc/openvpn/server/
chown root:root /etc/openvpn/server/<server name>.crt

################
# updating the client
################
mkdir /etc/easy-rsa/pki/signed
mv <certificate> /etc/easy-rsa/pki/signed
```

# other way

## creation keys and certs with easy-rsa

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
* https://wiki.archlinux.org/index.php/Easy-RSA
