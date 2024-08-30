# Tunneling

## Via SSH

### Socks (socket secure)

```bash
#create a connection
ssh -ND <a port number> <user>@<hostname>
#see
#   https://wiki.archlinux.org/index.php/Privoxy
#   https://en.wikipedia.org/wiki/SOCKS
```

### Port forwarding

```bash
# Forwards from localhost 9000 to 8888
# local_ip:
#   192.168.1.100
#   127.0.0.1
#   0.0.0.0
# ssh -L [<string: local_ip>]<int: local_port>:[<string: remote_ip>]:<int: remote_port> <string: user_name>@<string: hostname_or_ip>
# you can also add 
ssh -L 9000:127.0.0.1:8888 artodeto@bazzline.net
```

### Reverse

```bash
# Assumes:
#   * local machine is behind a firewall
#   * firewall blocks incoming ssh connection
#   * firewall allows outgoing ssh connection
# Create a tunnel from local machine to remote machine
ssh -R 22123:localhost:22 artodeto@bazzline.net
# In the ssh shell on bazzline.net
ssh -p 22123 user@localhost
```

### Reverse tunnel (packages from hostname:remote port goes to localhost:local port)

```bash
ssh -R <local port>:localhost:<remote port> <hostname>
```

### Just a ssh connection without opening a new shell

```bash
ssh -N
```

### Agent mode (use local keys and go over an other host to the target host)

```bash
ssh -A
```

## Other tools

```bash
mosh
socat
stunnel
openvpn
tinc
wireguard
```

