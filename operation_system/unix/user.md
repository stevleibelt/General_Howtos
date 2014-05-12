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

# run command as other user

    runuser -u <user> <command> <argument...>
    su - <user> -c "<command> <argument...>"
    sudo <command>

# change login shell

## fetch available shells

    less /etc/shells

## change shell

    chsh -s /path/to/my/shell
    # or
    chsh

# links

* https://wiki.archlinux.org/index.php/Users_and_Groups#User_management
* http://www.cyberciti.biz/open-source/command-line-hacks/linux-run-command-as-different-user/
* http://www.cyberciti.biz/faq/howto-change-linux-unix-freebsd-login-shell/
