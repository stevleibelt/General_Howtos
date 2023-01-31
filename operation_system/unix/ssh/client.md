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

### Copy key to destination

```bash
ssh-copy-id -i .ssh/my_key.pub user@host
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

