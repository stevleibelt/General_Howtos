# basic setup for "client-server"

There is no client and server in wireguard.
There are only peers.

## installation

```
#@see:
#   https://engineerworkshop.com/2020/02/20/how-to-set-up-wireguard-on-a-raspberry-pi/
#   https://wiki.archlinux.org/index.php/WireGuard
#if kernel < 5.6
#   install wireguard-dkms
#fi
#if ! ((systemd-networkd || NetworkManager) is used)
#   install wireguard-tools
#fi
```

## key generation

```
cd /etc/wireguard

#restrict reading and writing to owner only
umask 077

##create server secret and public key
wg genkey > peer_01.key #secret key
wg pubkey < peer_01.key > peer_01.pub
#or do all at once
wg genkey | tee peer_02.key | wg pubkey > peer_02.pub

#create a pre-shared key to increase cryptography security, one for each connection
##assuming you have three peers
wg genpsk > peer_01-peer_02.psk
wg genpsk > peer_01-peer_03.psk
wg genpsk > peer_02-peer_03.psk
```

## interface configuration

```
#create configuration file
#on peer_01
cat > wg0.conf <<DELIM
[Interface]
Address = 10.0.2.1/24, fdc9:281f:04d7:9ee9::1/64
ListenPort = 51871
PrivateKey = <content of peer_01.key>
#if your device should serve as dns
DNS = <ip address of your peer_01>
#if you create a systemd file, you can use %i to replace wg0 and create a multiple usage systemd file
##check if `eth0` is really your device
PostUp = iptables -A FORWARD -i eth0 -j ACCEPT; iptables -A FORWARD -o wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i eth0 -j ACCEPT; iptables -D FORWARD -o wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE

[Peer]
PublicKey = <content of peer_02.pub>
PresharedKey = <content of peer_01-peer_02.psk>
AllowedIPs = 10.0.2.2/32,fdc9:281f:04d7:9ee9::2/128
DELIM
```

## check configuration

```
#start the tunnel
wg-quick up wg0

#check ifall is running
wg
```

## misc

### create qrcode for client

```
sudo pacman -S qrencode
qrencode -t ansiutf8 -r <client.conf>
```

### enable web forwarding if you have kept MASQUERADE lines in the config

```
cat >/etc/sysctl.d/20-wireguard.conf<<DELIM
net.ipv4.ip_forward=1
net.ipv6.conf.all.forwarding=1
DELIM
```

### enable dns server option

```
cat >/etc/resolve.conf<<DELIM
nameserver 10.0.0.1
DELIM
```

# links 

* [Wireguard einrichten](https://www.geekbundle.org/wireguard-einrichten/) - 20200313
