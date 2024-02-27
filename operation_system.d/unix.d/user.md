# User management

## Remove login ability

```bash
usermod -s /usr/sbin/nologin <user name>
```

## Add user

```bash
## with system defaults
useradd <user name>

## with creating home directory (-m), initial group (-g) and additional groups
useradd -m -g <group one> -G <group two> -s /bin/bash <user name>

## as a system user (no home directory no option to log in)
useradd -r -s /usr/bin/nologin <user_name>
```

## Add groups

```bash
usermod -a -G <group one>[<,group two>] <user name>
#or
gpasswd -a <user name> <group name>
```

## Remove group

```bash
gpasswd -d <user name> <group name>
```

## List users

```bash
#default way
cat /etc/passwd
#or the cool way
getent passwd | grep '/home' | awk -F ':' '{ print $1 }'
```

## Set password for a user via a shell script

```bash
#executed as root
passwd <username> <<DELIM
<new password>
<new password>
DELIM
```

## Run command as other user

```bash
runuser -u <user name> <command> <argument...>
su - <user name> -c "<command> <argument...>"
sudo -u <command>
```

## Change username

```bash
#enable root login via ssh
#   sudo passwd root
#   vim /etc/ssh/sshd_config #PermitRootLogin yes
#   restart sshd.service
#   login as root
usermod -l <new_name> -d /home/<new_name> -m <old_name>
```

## Change login shell

```bash
# Fetch available shells
less /etc/shells
#if not available you should add the "nologin" shell
# echo "/sbin/nologin" >> /etc/shells

# change shell
chsh -s <path to shell> <user name>
#or
usermod -s <path to shell> <user name>
#or
chsh
```

## Rename user

```bash
usermod -l <old user name> <new user name>
#you should rename the fitting homefolder also
```

## Expire user

Benefit of expire a user is a clear message "your account as expired ...".

```bash
#check user password expiration date
chage -l <user name>

#expire now
chage --expiredate 0 <user name>

#expire in 14 days
chage --expiredate 14 <user name>

#reset expire
chage --expiredate -1 <user name>
```

## Lock user

```bash
#quickest way
usermod --lock <user name>

#the right way
usermod --lock -expiredate 1 --shell /bin/nologin <user name>

#unlock
usermod --unlock -expiredate 99999 --shell /bin/bash <user name>
```

## Delete user

```bash
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

## Get user id

```bash
# all informations
id <user name>
# only user id
id -u <user name>
# groups
id -a
```

## errorhandling

### Validate system integrity

```bash
#check groups
grpck
#checl password
pwck
```

## Links

* https://wiki.archlinux.org/index.php/Users_and_Groups#User_management
* http://www.cyberciti.biz/open-source/command-line-hacks/linux-run-command-as-different-user/
* http://www.cyberciti.biz/faq/howto-change-linux-unix-freebsd-login-shell/
* http://www.computerhope.com/unix/uid.htm
