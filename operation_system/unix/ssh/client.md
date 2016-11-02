# generate key

```
cd ~
cd .ssh/
ssh-keygen -t rsa -b 4096
```

# copy key to destination

```
ssh-copy-id -i .ssh/my_key.pub user@host
```

# configuration file

If you want to know more, man ssh_config is your friend.

```
#vim ~/.ssh/config
#structure is Host <name> with options
#configure something for all hosts
Host *
    ServerAliveInterval 120
#configure something for a dedicated host
Host bazzline.net
    #if this hostname is matching
    Hostname bazzline.net
    #with this user
    User artodeto
    #use this identity file
    IdentityFile ~/.ssh/net_bazzline_artodeto
```

# hints

## secure file authorized_keys

```
chmod 400 ~/.ssh/authorized_keys
chattr +i ~/.ssh
```

## enable verbose/debug mode

```
ssh <user>@<host> -vvv
```

# links

* [ssh keys](https://wiki.archlinux.org/index.php/SSH_Keys)
* [limit ssh acces by ip address](http://blog.serverbuddies.com/limit-ssh-access-by-ip-address/)
