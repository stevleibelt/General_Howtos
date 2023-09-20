# simple setup

* install system
* install fail2ban
* install pi-hole
```
#listen to all devices, like the later one wg0
sudo pihole -a -i all
```
* install firewall
```
sudo apt-get install ufw &&
sudo ufw allow 22/tcp &&
sudo ufw allow 51820/udp &&
sudo ufw status verbose
sudo ufw enable
```

## check things

```
#debug
pivpn -d
#show connected clients
pivpn -c
´´´
