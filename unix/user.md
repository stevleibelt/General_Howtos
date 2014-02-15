# remove login ability

usermod -s /usr/sbin/nologin $username

# add user

useradd $username

# add user with creating home directory (-m), initial group (-g) and additional groups

useradd -m -g myGroup -G myOtherGroup -s /bin/bash myUser

# add groups

usermod -a -G mygroup[,myothergroup] user

# list users

cat /etc/passwd

# links

* https://wiki.archlinux.org/index.php/Users_and_Groups#User_management
