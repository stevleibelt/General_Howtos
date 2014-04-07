# remove login ability

    usermod -s /usr/sbin/nologin $username

# add user

    useradd $username

# add user with creating home directory (-m), initial group (-g) and additional groups

    useradd -m -g myGroup -G myOtherGroup -s /bin/bash myUser

# add groups

    usermod -a -G myGroup[,myOtherGroup] User
    gpasswd -a myUser myGroup

# remove group

    gpasswd -d myUser myGroup

# list users

    cat /etc/passwd

# links

* https://wiki.archlinux.org/index.php/Users_and_Groups#User_management
