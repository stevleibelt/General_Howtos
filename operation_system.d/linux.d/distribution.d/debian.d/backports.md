# Backports on debian

## How to get backports

```
#add following line to your /etc/apt/source.list
deb http://<your-mirror>/debian-backports <debian-version-name>-backports main contrib non-free
```

## Install backport

```
apt-get -t <debian-version-name>-backports install <package>
```

## Links

* http://backports.debian.org/Instructions/
* https://wiki.debian.org/Backports
* http://backports.debian.org/Mirrors/
