# add to /etc/pacman.conf

[demz-repo-core]
SigLevel = Required
Server = http://demizerone.com/$repo/$arch

# on shell

pacman-key -r 0EE7A126
pacman-key --lsign-key 0EE7A126
pacman -Syy archzfs
