# Manage groups under unix

```bash
# add group
groupadd <name>

# delete group
groupdel <name>

# list groups
cat /etc/group | sort | less

# list groups per user
groups $username

# add user to group
usermod -a -G $group,$group $user
#or
gpasswd -a <user name> <group name>
#make current user session aware of this new group
newgrp <group name>

# add groupid
chmod -R g+s $path

# add group sticky bit
chmod -R 2775 $path

# add sticky bit
chmod -R +s $path

# add sticky bit for user
u+s

# add sticky bit for group
g+s

# add sticky bit for other
o+t
```
