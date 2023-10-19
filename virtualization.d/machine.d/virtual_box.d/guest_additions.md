# do it by hand

## install on debian

* inset guest additions in your virtual box (Device -> Insert ...)
* open a shell in your virtual machine

```
sudo su
#or su root
apt-get update
apt-get upgrade
# install needed components, especially the linux headres of your current kernel
apt-get install gcc make linux-headers-$(uname -r)

mount /dev/sr0 /mnt
./mnt/VBoxLinuxAdditions.run

reboot
```
