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
