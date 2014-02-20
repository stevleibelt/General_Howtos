# set ip address the demon is listen on

ListenAddress <ip-address>

# root is not allowed to log in

PermitRootLogin no

# allow only following users to log in

AllowUsers myUserOne[,myUserTwo]

# allow only following groups to log in

AllowGroups myGroupOne[,myGroupTwo]

# generate key

ssh-keygen -t rsa -b 4096

# copy key to destination

ssh-copy-id -i .ssh/my_key.pub user@host

# hints

## secure file authorized_keys

chmod 400 ~/.ssh/authorized_keys
chattr +i ~/.ssh

## disable password login

/etc/ssh/sshd_config
PasswordAuthentication no
ChallengeResponseAuthentication no

# links

* https://wiki.archlinux.org/index.php/SSH_Keys
