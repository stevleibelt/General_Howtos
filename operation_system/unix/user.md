# remove login ability

```
usermod -s /usr/sbin/nologin <user name>
```

# add user

```
## with system defaults
useradd <user name>

## with creating home directory (-m), initial group (-g) and additional groups
useradd -m -g <group one> -G <group two> -s /bin/bash <user name>

## as a system user (no home directory no option to log in)
useradd -r -s /usr/bin/nologin <user_name>
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

# set password for a user via a shell script

```
#executed as root
passwd <username> <<DELIM
<new password>
<new password>
DELIM
```

# run command as other user

```
runuser -u <user name> <command> <argument...>
su - <user name> -c "<command> <argument...>"
sudo -u <command>
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

# rename user

```
usermod -l <old user name> <new user name>
#you should rename the fitting homefolder also
```

# expire user

Benefit of expire a user is a clear message "your account as expired ...".

```
#expire now
chage --expiredate 0 <user name>

#expire in 14 days
chage --expiredate 14 <user name>

#reset expire
chage --expiredate -1 <user name>
```

# lock user

```
#quickest way
usermod --lock <user name>

#the right way
usermod --lock -expiredate 1 --shell /bin/nologin <user name>

#unlock
usermod --unlock -expiredate 99999 --shell /bin/bash <user name>
```

# delete user

```
#check if user exists on the machine
getent passwd <user name>

#check if processes are running
ps aux | grep "^<user name>"

#check files owned by the user
find / -xdev -user <user name>

#delete user
##on debian systems
deluser --remove-home <user name>

##on non debian systems
userdel --remove <user name>
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
