# basic howto

## by using PKGBUILD

```
git clone https://aur.archlinux.org/<your package>
cd <your package>
makepkg -sri
#for archlinuxarm
makepkg -Acs    #A stands for ignore architecture
pacman -U *.tar.xz
```

## by building from source (if shipped with PKGBUILD)

```
wget <source path of your package>
tar -xzf <source file>
makepkg -sri
pacman -U *.tar.xz
```

# pacaur

## installation

```
mkdir /tmp/pacaur
cd /tmp/pacaur
wget https://aur.archlinux.org/cgit/aur.git/snapshot/pacaur.tar.gz
tar -xzf pacaur.tar.gz
cd pacaur
makepkg -sri
pacman -U *.tar.xz
```

# yaourt

## search and install

```
yaourt <search pattern>
```

## update installed packages

```
yaourt -Syua
```

## build packages from source

```
yaourt -Sb <package>
```

## backup database

```
yaourt -B 
```

## query backup

```
yaourt -Q --backupfile <file>
```

## add yaourt repository

```
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch
```

# error

## FAILED (unknown public key <key>)

```
pgp --recv-keys <key>
```
## links

* https://wiki.archlinux.org/index.php/AUR_helpers
* http://archlinux.fr/man/yaourt.8.html
* https://github.com/Jguer/yay
* https://github.com/polygamma/aurman
* https://github.com/trizen/trizen
* https://xyne.archlinux.ca/projects/bauerbill/
