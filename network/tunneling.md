# ssh

## socks (socket secure)

```
#create a connection
ssh -ND <a port number> <user>@<hostname>
#see
#   https://wiki.archlinux.org/index.php/Privoxy
#   https://en.wikipedia.org/wiki/SOCKS
```

## port forwarding

```
#forwards from localhost 9000 to 8888
ssh -L <local port>:target:<remote port> <user>@<hostname>
```

## reverse tunnel (packages from hostname:remote port goes to localhost:local port)

```
ssh -R <local port>:localhost:<remote port> <hostname>
```

## just a ssh connection without opening a new shell

```
ssh -N
```

## agent mode (use local keys and go over an other host to the target host)

```
ssh -A
```

# openvpn

```
```

# others

```
mosh
socat
stunnel
openvpn
tinc
```
