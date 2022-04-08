# signatur from ... is unknown trust

```
####
#1.) try - refresh key store
####
sudo pacman -Sy archlinux-keyring
sudo pacman -Su

####
#2.) try - recreating key store
#@see:
#   https://wiki.archlinux.org/index.php/Pacman/Package_signing#Resetting_all_the_keys
####
sudo mv /etc/pacman.d/gnupg /etc/pacman.d/gnupg.<currentdate>

sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -Syyu
```
