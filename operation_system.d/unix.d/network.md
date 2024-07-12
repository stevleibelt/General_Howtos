# Network

## Needed Packagist

* bind-tools

## Get hostname of current system

```bash
hostname
```

## Package not available? try to install dnsutils

## Get ip by domain

```bash
nslookup www.bazzline.net
dig bazzline.net
```

## Get other informations

```bash
nslookup 123.45.678.9
```

## Gets server for domain

```bash
#possible installation of whois is needed
whois bazzline.net
```

## Get a available rout

```bash
traceroute www.bazzline.net
```

## Get entries from name service switch library

```bash
getent hosts bazzline.net
```

## Check availability

```bash
ping www.bazzline.net
```

## Low level protocols

### IP - internet protocoll

ip contains, in general, a source and a destination socket.
ip simple sends packages from source to destination without doing checks (if package receives, is checksum valid, receives in right order etc.)
ip is robust 'cause of the simple implementation.
ip is used by the three famost protocols tcp, udp and icmp.

### TCP - transmission control protocol

tcp does what ip can't, checks if package receives, if checksum is valid and if the ordering fits.

### ICMP - internet controll message protocol

simple protocol to message between systems

### UDP - user data protocol

udp is only validating the checksum.

### Socket

socket is end/start point of a connection/link between two maschines.

### SMTP - simple mail transport protocol

port 25, try "telnet hostname 25"

available commands:
- HELO
- USER foo
- PASS \*\*\*\*
- LIST
- RETR $numberOfListedMail
- DELE $numberOfListedMail
- MAIL FROM: foo@bar.de
- RCPT TO: foo@bar.de
- QUIT
- ...

#### 503 5.5.1 Error: authentication not enabled

##### Links

* http://data.agaric.com/postfix-and-authenticated-smtp
* https://workaround.org/ispmail/lenny/authenticated-smtp
* http://htyp.org/503_5.5.1_Error:_authentication_not_enabled

### HTTP

port 80, try "telnet hostname 80"
available commands:
- GET /list
- GET /list HTTP/1.0
- GET /list HTTP/1.1

## Communicate with other machines

```bash
telnet hostname|ip
```

