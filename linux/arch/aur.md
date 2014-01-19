# basic howto

wget http://www.my.file .
tar xzf my.file
makepkg
pacman -U *.tar.xz

# yaourt

## search and install

yaourt <search pattern>

## update installed packages

yaourt -Syua

## build packages from source

yaourt -Sb <package>

## backup database

yaourt -B 

## query backup

yaourt -Q --backupfile <file>

## add yaourt repository

[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch

## links

http://archlinux.fr/man/yaourt.8.html
