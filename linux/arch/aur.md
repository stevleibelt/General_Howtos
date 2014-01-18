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

## links

http://archlinux.fr/man/yaourt.8.html
