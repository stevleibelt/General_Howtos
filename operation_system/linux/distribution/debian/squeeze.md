# update to oracle java 7

## commands

```
sudo su
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
apt-get update
apt-get install oracle-java7-installer
apt-get install oracle-java7-set-default
exit
```

## source

* http://www.webupd8.org/2012/06/how-to-install-oracle-java-7-in-debian.html
