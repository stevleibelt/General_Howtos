# get hostname of current system

    hostname

# package not available? try to install dnsutils

# get ip by domain

    nslookup www.bazzline.net

# get other informations

    nslookup 123.45.678.9

# gets server for domain

    whois bazzline.net

# get a available rout

    traceroute www.bazzline.net

# check availability

    pint www.bazzline.net

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
- PASS ****
- LIST
- RETR $numberOfListedMail
- DELE $numberOfListedMail
- MAIL FROM: foo@bar.de
- RCPT TO: foo@bar.de
- QUIT
- ...

## http

port 80, try "telnet hostname 80"
available commands:
- GET /list
- GET /list HTTP/1.0
- GET /list HTTP/1.1

# communicate with other machines

    telnet hostname|ip
