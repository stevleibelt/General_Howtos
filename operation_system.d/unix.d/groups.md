# Manage groups under unix

```bash
# add group
groupadd <string: name>

# delete group
groupdel <string: name>

# list groups
cat /etc/group | sort | less

# list groups per user
groups <string: username>

# add user to group
usermod -a -G <string: group_name>[<string: group_name>] <string: user_name>
#or
gpasswd -a <string: user_name> <string: group_name>
#make current user session aware of this new group
newgrp <string: group_name>

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
