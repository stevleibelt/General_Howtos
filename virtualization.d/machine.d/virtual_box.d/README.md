# vboxmanage

## list available vm

```
VBoxManage list vms
```

## delete vm

```
VBoxManage unregistervm <hash id> --delete
```

# handle box/images

```
#list available boxes
vagrant box list

#upgrade boxes
vagrant box upgrade

#list outdated
vagrant box outdated

#remove outdated boxes
vagrant box prune
```

# links

* [`Vagrant box` command line options.](https://www.vagrantup.com/docs/cli/box.html)
* https://wiki.archlinux.org/index.php/VirtualBox/Tips_and_tricks
* https://en.wikipedia.org/wiki/VirtualBox
* [VBoxManage](https://www.virtualbox.org/manual/ch08.html)
* http://nakkaya.com/2012/08/30/create-manage-virtualBox-vms-from-the-command-line/
* https://www.loggn.de/ubuntu-debian-virtualbox-3-1-vm-ohne-gui-auf-der-shell-erstellen-und-einrichten/
* https://www.virtualbox.org/manual/ch06.html#networkingmodes
* https://www.virtualbox.org/manual/ch08.html#vboxmanage-controlvm
