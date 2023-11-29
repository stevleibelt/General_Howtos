# needed packagist

* bind-tools

# get hostname of current system

```
hostname
```

# package not available? try to install dnsutils

# get ip by domain

```
nslookup www.bazzline.net
dig bazzline.net
```

# get other informations

```
nslookup 123.45.678.9
```

# gets server for domain

```
#possible installation of whois is needed
whois bazzline.net
```

# get a available rout

```
traceroute www.bazzline.net
```

# get entries from name service switch library

```
getent hosts bazzline.net
```

# check availability

```
ping www.bazzline.net
```

# low level protocols

## ip - internet protocoll

ip contains, in general, a source and a destination socket.
ip simple sends packages from source to destination without doing checks (if package receives, is checksum valid, receives in right order etc.)
ip is robust 'cause of the simple implementation.
ip is used by the three famost protocols tcp, udp and icmp.

## tcp - transmission control protocol

tcp does what ip can't, checks if package receives, if checksum is valid and if the ordering fits.

## icmp - internet controll message protocol

simple protocol to message between systems

## udp - user data protocol

udp is only validating the checksum.

## socket

socket is end/start point of a connection/link between two maschines.

## smtp - simple mail transport protocol

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

### 503 5.5.1 Error: authentication not enabled

#### links

* http://data.agaric.com/postfix-and-authenticated-smtp
* https://workaround.org/ispmail/lenny/authenticated-smtp
* http://htyp.org/503_5.5.1_Error:_authentication_not_enabled

## http

port 80, try "telnet hostname 80"
available commands:
- GET /list
- GET /list HTTP/1.0
- GET /list HTTP/1.1

# communicate with other machines

```
telnet hostname|ip
```
