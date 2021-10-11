# upgrade do a new version

## prepare yourself

```
screen
#if you are not root
sudo su

#mount all needed partitions writeable
#mount -o remount,rw /<mountpoint>

#check your diskspace
apt-get -o APT::Get::Trivial-Only=true dist-upgrade
```

## check package status

```
apt-get autoremove
apt-get autoclean
dpkg --audit
#or if you want to have the long version
dpkg -l | pager
#if needed reinstall packages with
apt-get install --reinstall <list of packages>
```

## updage package source

```
#check unofficial sources and adapt them in /etc/apt/source.list when needed
#open /etc/apt/source.list
#   change your version with the one you want to upgrade to, e.g. replace wheezy with jessie
#foreach file in /etc/apt/source.list.d/*
#   change your version with the one you want to upgrade to, e.g. replace wheezy with jessie
```

## upgrade

```
#fetch latest sources
apt-get update
#do the minimal system upgrade
apt-get upgrade
#upgrade the rest
apt-get dist-upgrade
#purge old cache
apt-get purge $(dpkg -l | awk '/^rc/ { print $2 }') #dpkg -l lists installed software, if it starts with rc
apt-get autoremove
apt-get autoclean
```

If you run into problems, first try is to reinstall the software.

```
apt-get install --reinstall <package name>
#if this is failing
apt-get remove --purge <package name>
apt-get install <package name>
```

# upgrade paths

## from 10 (buster) to 11 (bullseye)

```
#update current system
sudo apt update && sudo apt upgrade
sudo apt install gcc-8-base

#adapt source list
sudo cp /etc/apt/sources.list /etc/apt/sources.list.20210819
sudo sed -i -e 's/buster/bullseye/g' /etc/apt/sources.list
#optional, repeat the two steps above with every file in /etc/apt/source.list.d

#do the upgrade
sudo apt update
#apt full-upgrade is working too
sudo apt dist-upgrade

#after upgrade
sudo systemctl reboot
sudo apt --purge autoremove

#if you want to
#cat /etc/issue would work too
cat /etc/os-release
```

# links

* https://www.debian.org/releases/stable/i386/release-notes/ch-upgrading.html
* http://www.muktware.io/upgrade-from-debian-7-to-debian-8/
