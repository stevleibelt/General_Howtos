# list groups
cat /etc/group | sort | less

# list groups per user
groups $user

# add user to group
usermod -a -G $group,$group $user

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
