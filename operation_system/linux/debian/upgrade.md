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

# links

* https://www.debian.org/releases/stable/i386/release-notes/ch-upgrading.html
* http://www.muktware.io/upgrade-from-debian-7-to-debian-8/
