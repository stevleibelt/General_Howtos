# do not ask for confirmation (no good idea except you run pacman from a script)

```
--noconfirm
```

# clear cache of old packages

```
pacman -Sc
```

# update local database

```
pacman -Sy
```

# update installed packages

```
pacman -Su
```

# update list and upgrade packages

```
pacman -Syu
```

# build up local database

```
pacman -Syuu
```

# ignore package

```
pacman -Syuu --ignore=linux-lts[,linux-lts-headers]
```

# search for package

```
pacman -Ss $name
```

# show installed packages

```
pacman -Q
```

# remove package

```
pacman -R $name
```

# remove package and all dependencies

```
pacman -Rs <name>
# remove unneeded
pacman -Rsu <name>
```

# reinstall with force

```
pacman -Syy --force <package>
```

# list unneeded packages

```
pacman -Qdt
```

# remove unneeded packages

```
pacman -Rsn `pacman -Qqdt`
```

# locate .pac\* files

```
# in /etc
find /etc -regextype posix-extended -regex ".+\.pac(new|save|orig)" 2> /dev/null

# on entire file system
find / -regextype posix-extended -regex ".+\.pac(new|save|orig)" 2> /dev/null

# by locate
# updatedb
locate -e --regex "\.pac(new|orig|save)$"

# by pacmans log
egrep "pac(new|orig|save)" /var/log/pacman.log
```

# install and setup reflector

```
sudo su
#set your country like "United States" or "Germany" etc.
#fetch a list of available countries via "cat /etc/pacman.d/mirrorlist | grep '## ' | grep -v 'Arch\|Generated' | awk '{ print $2}'"
COUNTRY_NAME="Germany"
MAXIMUM_NUBERS_OF_SERVERS_TO_USE=200

pacman -S reflector
mkdir -p /etc/pacman.d/hooks

cat > /etc/pacman.d/hooks/trigger_reflector_on_mirrorlist_update.hook < DELIM
[Trigger]
Operation = Upgrade
Type = Package
Target = pacman-mirrorlist

[Action]
Description = Updating pacman-mirrorlist with reflector and removing pacnew...
When = PostTransaction
Depends = reflector
Exec = /usr/bin/bash -c "reflector --country '$(echo ${COUNTRY_NAME})' -l $(echo ${MAXIMUM_NUBERS_OF_SERVERS_TO_USE}) --sort rate --save /etc/pacman.d/mirrorlist && [[ -f /etc/pacman.d/mirrorlist.pacnew ]] && rm /etc/pacman.d/mirrorlist.pacnew"
DELIM
```

# links

* https://wiki.archlinux.org/index.php/Pacman_tips#Custom_local_repository
* https://wiki.archlinux.de/title/Pacman
* https://wiki.archlinux.org/index.php/Pacnew_and_Pacsave_Files
* https://wiki.archlinux.org/index.php/User:Allan/Pacman_Hooks
* https://wiki.archlinux.org/index.php/DeveloperWiki:Pacman_Hooks
* https://wiki.archlinux.org/index.php/Reflector
* https://wiki.archlinux.org/index.php/Mirrors
