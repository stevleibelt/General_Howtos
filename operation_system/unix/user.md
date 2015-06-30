# remove login ability

```
usermod -s /usr/sbin/nologin <user name>
```

# add user

```
useradd <user name>
```

# add user with creating home directory (-m), initial group (-g) and additional groups

```
useradd -m -g <group one> -G <group two> -s /bin/bash <user name>
```

# add groups

```
usermod -a -G <group one>[<,group two>] <user name>
#or
gpasswd -a <user name> <group name>
```

# remove group

```
gpasswd -d <user name> <group name>
```

# list users

```
#default way
cat /etc/passwd
#or the cool way
getent passwd | grep '/home' | awk -F ':' '{ print $1 }'
```

# run command as other user

```
runuser -u <user name> <command> <argument...>
su - <user name> -c "<command> <argument...>"
sudo <command>
```

# change login shell

## fetch available shells

```
less /etc/shells
#if not available you should add the "nologin" shell
# echo "/sbin/nologin" >> /etc/shells
```

## change shell

```
chsh -s <path to shell> <user name>
#or
usermod -s <path to shell> <user name>
#or
chsh
```

# lock user

```
usermod -L <user name>
```

# unlock user

```
usermod -U <user name>
```

# get user id

```
# all informations
id <user name>
# only user id
id -u <user name>
# groups
id -a
```

# errorhandling

## validate system integrity

```
#check groups
grpck
#checl password
pwck
```

# links

* https://wiki.archlinux.org/index.php/Users_and_Groups#User_management
* http://www.cyberciti.biz/open-source/command-line-hacks/linux-run-command-as-different-user/
* http://www.cyberciti.biz/faq/howto-change-linux-unix-freebsd-login-shell/
* http://www.computerhope.com/unix/uid.htm
