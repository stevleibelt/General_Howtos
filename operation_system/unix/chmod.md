# octal notation

    4	read
    2	write
    1	execute/list

# alphabetic notation

    r	read
    w	write
    x	execute/list

# permit others reading

    chmod -R o+r *

# do all in one call

    # user can do all, group can read an execute, others can do nothing
    chmod u=rwxs,g=rx,o=

# setuid

* setuid sets the user id the programm/script will run when executed
* setuid is marked/set on the first three (user) area

## user web executes myprogramm

    chmod u+s web /usr/bin/myprogramm
    -rwsr-x-r--
    1 web web 42312 Oct 06 1983 /usr/bin/myprogramm

# setgid

* acts like the setuid but this time the group is used

    chmod g+s web /usr/bin/myprogramm

# stickybit

* by setting the stickybit, only the user who creates a file is allowed to delete it
* very usefull for temporary directories or general shared space

    chmod +t

# links

* http://www.computerhope.com/unix/uchmod.htm
* https://en.wikipedia.org/wiki/Chmod
