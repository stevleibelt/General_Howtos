# do not ask for confirmation (no good idea except you run pacman from a script)

    --noconfirm

# cleare old/unused packages

    pacman -Sc

# update local database

    pacman -Sy

# update installed packages

    pacman -Su

# update list and upgrade packages

    pacman -Syu

# build up local database

    pacman -Syuu

# search for package

    pacman -Ss $name

# show installed packages

    pacman -Q

# remove package

    pacman -R $name

# remove package and all dependencies

    pacman -Rs $name

# reinstall with force

    pacman -Syy --force <package>

# list unneeded packages

    pacman -Qdt

# remove unneeded packages

    pacman -Rsn `pacman -Qqdt`

# locate .pac* files

    # in /etc
    find /etc -regextype posix-extended -regex ".+\.pac(new|save|orig)" 2> /dev/null

    # on entire file system
    find / -regextype posix-extended -regex ".+\.pac(new|save|orig)" 2> /dev/null

    # by locate
    # updatedb
    locate -e --regex "\.pac(new|orig|save)$"

    # by pacmans log
    egrep "pac(new|orig|save)" /var/log/pacman.log

# links

* https://wiki.archlinux.de/title/Pacman
* https://wiki.archlinux.org/index.php/Pacnew_and_Pacsave_Files
