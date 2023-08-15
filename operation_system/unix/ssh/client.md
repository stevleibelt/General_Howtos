# SSH as client

## Generate key

```bash
cd ~
cd .ssh/
ssh-keygen -t rsa -b 4096
#or, if you trust curves
ssh-keygen -t ed25519
```

### Test passphrase

```bash
ssh-keygen -y -f <string: path_to_the_private_key>
```

### Update passphrase

```bash
ssh-keygen -p -f <string: path_to_the_private_key>
```

### Copy key to destination

```bash
ssh-copy-id -i .ssh/my_key.pub user@host
```

## Bind local port to remote port

```bash
#useful if you develop something on the remote machine and want to have access on it
#   e.g. develop a web application listening on port 1080 on the remote machine but you
#   want to call it with the local webbrowser
ssh -L 1080:127.0.0.1:1080 [user@hostname_or_ip | ssh-config-name]
```

## Client configuration file

If you want to know more, `man ssh_config` is your friend.

```bash
#vim ~/.ssh/config
# Structure is Host <string: name> with options
# Configure something for all hosts
Host *
    ServerAliveInterval 120

# Configure something for a dedicated host
# Best naming schema is for Host is <string: remote.host-user>
Host bazzline.net-artodeto
    # If this hostname is matching
    Hostname bazzline.net
    # With this user
    User artodeto
    # Use this identity file
    IdentityFile ~/.ssh/net_bazzline_artodeto_19700101
    # If you need to use a jumphost
    #  Of course, you should create a dedicated configuration
    #   section for jump.host-user
    ProxyJump jump.host-user

```

## Hints

### Check the ssh connection

```bash
#useful if you want to verify that your connection goes over
#   a jumphost
#execut the following command on your jumped host
env | grep -i ssh_conn
#it should contain two ip address
#first should be the address of your jump host, second of your
#   target host followed by the port
```

### Secure file authorized_keys

```bash
chmod 400 ~/.ssh/authorized_keys
chattr +i ~/.ssh
```

### Enable verbose/debug mode

```bash
ssh -vvv <user>@<host>
```

### Change to use ipv4 only

```bash
ssh -4 <user>@<host>
```

### Export user environment

Add the following line to `~/.ssh/config`. This is the fitting client configuration part to [this](server.md#allow-local-user-export-variable) part.

```bash
SendEnv BAZZLINE_ENVIRONMENT
```

## Links

* [limit ssh acces by ip address](http://blog.serverbuddies.com/limit-ssh-access-by-ip-address/)
* [ssh keys](https://wiki.archlinux.org/index.php/SSH_Keys)
* [ssh proxy bastion proxyjump](https://www.redhat.com/sysadmin/ssh-proxy-bastion-proxyjump) - 20221122

