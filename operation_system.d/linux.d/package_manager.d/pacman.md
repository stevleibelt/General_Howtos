# Pacman package manager

```bash
#do not ask for confirmation (no good idea except you run pacman from a script)
--noconfirm

#clear cache of old packages
pacman -Sc

#update local database
pacman -Sy

#update installed packages
pacman -Su

#update list and upgrade packages
pacman -Syu

#build up local database
pacman -Syuu

#ignore package
pacman -Syuu --ignore=linux-lts[,linux-lts-headers]

#search for package
pacman -Ss $name

#show installed packages
pacman -Q

#remove package
pacman -R $name

#remove by searchin locally
pacman -Rcns <string: package_name>

#remove package and all dependencies
pacman -Rs <name>
# remove unneeded
pacman -Rsu <name>

#reinstall with force
pacman -Syy --force <package>

#list unneeded packages
pacman -Qdt

#remove unneeded packages
pacman -Rsn `pacman -Qqdt`
```

## Error solving

```bash
#list the current used server for <section>
#example done by <section> core
pacman-conf --repo core Server

#warning <...> is newer than <...>
#update all packages
sudo pacman -Syu

#if upper step did not do the trick
#update all packages, then downgrade all affected packages to the current
#   and latest available version
sudo pacman -Suu

#full upgrade
sudo pacman -Syyu
```

## Date back packman repository status

[see](https://github.com/archzfs/archzfs/issues/419#issuecomment-978018918)

```bash
[core]
SigLevel = PackageRequired
Server=https://archive.archlinux.org/repos/1983/10/06/$repo/os/$arch
```

## Locate .pac\* files

```bash
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

## Install and Setup Reflector

```bash
sudo su
#set your country like "United States" or "Germany" etc.
#fetch a list of available countries via "cat /etc/pacman.d/mirrorlist | grep '## ' | grep -v 'Arch\|Generated' | awk '{ print $2}'"
COUNTRY_NAME="Germany"
MAXIMUM_NUBERS_OF_SERVERS_TO_USE=200

pacman -S reflector
mkdir -p /etc/pacman.d/hooks

cat > /etc/pacman.d/hooks/trigger_reflector_on_mirrorlist_update.hook <<DELIM
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

## Update Mirrorlist

```bash
# by hand, has to be done as root
# backup old mirrorlost
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
# download new mirrorlist
# change or remove country section
curl -o mirrorlist "https://archlinux.org/mirrorlist/?country=DE&protocol=https&ip_version=4&ip_version=6"
# enable servers
sed -i 's/^#Server/Server/1' mirrorlist

# by using reflector
sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

## Links

* https://wiki.archlinux.org/index.php/Pacman_tips#Custom_local_repository
* https://wiki.archlinux.de/title/Pacman
* https://wiki.archlinux.org/index.php/Pacnew_and_Pacsave_Files
* https://wiki.archlinux.org/index.php/User:Allan/Pacman_Hooks
* https://wiki.archlinux.org/index.php/DeveloperWiki:Pacman_Hooks
* https://wiki.archlinux.org/index.php/Reflector
* https://wiki.archlinux.org/index.php/Mirrors
* [package archive](https://archive.archlinux.org/packages/)

