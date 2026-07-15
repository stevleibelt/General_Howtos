# chown and chmod

## Notation

| Description | Octal | Alphabetic |
| --- | --- | --- |
| read | 4 | r |
| write | 2 | w |
| execute/list | 1 | x |

## Permit others reading

```bash
chmod -R o+r *
```

## Do all in one call

```bash
# User can do all, group can read an execute, others can do nothing
chmod u=rwxs,g=rx,o=
```

## Setuid

* Setuid sets the user id the programm/script will run when executed
* Setuid is marked/set on the first three (user) area

## Fix file permissions errors on linux

```bash
# Fetch user id
id --user

# List current path owner
sudo ls --numeric-uid-gid

# Change ownership
sudo chown <user id> <path>

# Change access
sudo chmod 755 <path>
```

### User web executes myprogramm

```bash
chmod u+s web /usr/bin/myprogramm
-rwsr-x-r--
1 web web 42312 Oct 06 1983 /usr/bin/myprogramm
```

## Setgid

* Acts like the setuid but this time the group is used

```bash
chmod g+s web /usr/bin/myprogramm
```

## Stickybit

* By setting the stickybit, only the user who creates a file is allowed to delete it
* Very usefull for temporary directories or general shared space
 
```bash
chmod +t
```

## Do not change target of symbolic links

```bash
#@see: https://utcc.utoronto.ca/~cks/space/blog/sysadmin/ChownSymlinkSafety
chmod -h
```

## Links

* [Fix file permission errors on linux](https://opensource.com/article/22/8/fix-file-permission-errors-linux) - 20220808
* [do a >>chown -hR<< instead of a >>chown -R<<.](https://utcc.utoronto.ca/~cks/space/blog/sysadmin/ChownSymlinkSafety)
* [setuid, setgid, and the Sticky Bit Explained](https://linuxize.com/post/setuid-setgid-sticky-bit/) - 20260715
* http://www.computerhope.com/unix/uchmod.htm
* https://en.wikipedia.org/wiki/Chmod
* http://catcode.com/teachmod/

