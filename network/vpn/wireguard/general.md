# basic setup for "client-server"

There is no client and server in wireguard.
There are only peers.

```
#@see: https://engineerworkshop.com/2020/02/20/how-to-set-up-wireguard-on-a-raspberry-pi/
#install wireguard
#sudo su
#cd /etc/wireguard

#create keys
umask 077
wg genkey | tee server_private_key | wg pubkey > server_public_key
wg genkey | tee client_private_key | wg pubkey > client_public_key

#create configuration file
cat > wg0.conf <<DELIM
[Interface]
Address = 10.253.3.1/24
SaveConfig = true
PrivateKey = <insert server_private_key>
ListenPort = 51900

PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE

[Peer]
PublicKey = <insert client_public_key>
AllowedIPs = 10.253.3.2/32
DELIM

vim /etc/sysctl.conf
#uncomment the line >>net.ipv4.ip_forward=1<<

#start wirequard
chown -R root:root /etc/wireguard/
chmod -R og-rwx /etc/wireguard/*
systemctl enable wg-quick@wg0
#setup port forwarding for udp 51900 in your router
systemctl start wg-quick@wg0
```
