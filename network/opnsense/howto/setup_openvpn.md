# Setup OpenVPN

## HowTo

### Configure TOTP server

* System -> Access -> Servers -> `+`
* Give it a name like `OpenVPN 2FA`
* Type `Local + Timebased One time Password`
* `Save`

### Add Certificate Authority

* System -> Trust -> Authorities -> `+`
* Name like `OpenVPN CA`
* Method `Create an internal Certificate Authority`
* Key length `4096`
* Digest Algorithm `SHA512`
* Lifetime `365`
* Country Code and all others
* Common name `internal-sslvpn-ca`
* `Save`

### Create a Server Certificate

* System -> Trust -> Certificates -> `+`
* Name like `OpenVPN Server CA`
* Method `Create an internal Certificate`
* Certificate authority `Certificate authority`
* Type `Server Certificate`
* Key length `4096`
* Digest Algorithm `SHA512`
* Lifetime `365`
* Country Code and all others
* Common name `SSLVPN Server Certificate`
* `Save`

### Adding a User

* System -> Access -> Users -> `+`
* Create a basic user 
* Check `Click to create a user certificate. `
* Check `Generate new secret (160 bit)`
* `Save`

* Method `Create an internal Certificate`
* Type `Client Certificate`
* Key lenght `4096`
* Digest Algorithm `SHA512`
* Lifetime `365`
* `Save`

### Add SSL Server

* VPN -> OpenVPN -> Servers -> `Add`
* Description `My SSL VPN Server`
* Server Mode `Remote Access (SSL/TLS + User Auth`
* Backend for authentication -> Select your TOTP server
* Protocol `UDP`
* Device mode `tun`
* Interface `WAN`
* Local port `1194`
* TLS Authentication `Leave both on enabled (checked)`
* Peer Certificate Revocation List `N/A`
* Server Certificate -> Your cenerated server certificate
* DH Parameters Lenght `4096 bit`
* Encryption algorithm `AES-256-CBC (256-bit key, 128-bit block)`
* Auth Digest Algorithm `SHA512 (512-bit)`
* Certificate Depth `One (Client+Server)`
* IPv4 Tunnel Network `10.10.0.0/24`
* IPv4 Local Networks `192.168.1.0/24`
* Compression `Enabled LZ4 v2 algorithm`
* Disable IPv6 `Checked`
* `Save`

### Firewall Rules

* Firewall -> Rules -> WAN -> `+`
* Interface `WAN`
* Direction `in`
* TCP/IP Version `IPv4`
* Protocol `UDP`
* Destination port range from `OpenVPN`
* Destination port range to `OpenVPN`
* Description `Allow VPN traffic`
* `Save`

* Firewall -> Rules -> OpenVPN -> `+`
* Interface `OpenVPN`
* Direction `in`
* TCP/IP Verison `IPv4`
* Source `Single host or Network`
* `10.10.0.0/24`
* Description `Allow OpenVPN traffic`
* `Save`

### Export Client Configuration

* VPN -> OpenVPN -> Client Export
* If you use dynamic dns, put in your hostname into `Hostname`
* Select your certificate
* Download your user configuration

## Links

* [Virtual Private Networking](https://docs.opnsense.org/manual/vpnet.html]) - 20221020
* [Setup SSL VPN Road Warrior](https://docs.opnsense.org/manual/how-tos/sslvpn_client.html) - 20221020

