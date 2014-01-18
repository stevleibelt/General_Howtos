# creation keys and certs by hand

## create root certificat

openssl req <certificate request> -newkey <type:keylength> -days <validity in days> -keyout <private certificate key> -out <certificate>
openssl req -x509 -newkey rsa:4096 -days 3650 -keyout root.key -out root.crt

## create server certificate request

openssl req -newkey <tye:keylength> -keyout <private certificate key> -out <certificate signing request>
openssl req -newkey rsa:4096 -keyout server_one.key -out server_one.csr

## prepare openssl

vim /etc/ssl/openssl.cnf

configure:
dir         #basedir
database    #index file for certificates
serial      #serial number
certificate #path/to/root.crt
private_key #path/to/root.key

### hint

echo '01' > index.txt   #initial index value

add following entries also:
localityName_default            = Some-Locality
organizationalUnitName_default  = Some-Organizational
commonName_default              = Some-Name
emailAddress_default            = some@email.address

## sign server certificate request with root certificate

openssl ca -cert <master certificate> -keyfile <master certificate key> -out <certificate>  -in <certificate signing request>
openssl ca -cert root.crt -keyfile root.key -out server_one.crt -in server_one.csr


### hint

if you create a ca topology, the organization have to be the same and the certificates have to be different in at least one entry (like common name).

you can also create a topology (root certificate that creates other certificates and so on) of certificates.
search for "-extension v3_ca".

openssl req -newkey rsa:4096 -keyout openVpn.key -out openVpn.csr

openssl ca -cert root.crt -keyfile root.key -in openVpn.csr -out openVpn.crt -extensions v3_ca

openssl req -newkey rsa:4096 -keyout server_one.key -out server_one.csr

if something goes wrong, remove index.txt.* files, remove entires in index.txt and revert line in serial to 01.
