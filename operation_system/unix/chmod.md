# chown and chmod

## Octal notation

```
4	read
2	write
1	execute/list
```

## Alphabetic notation

```
r	read
w	write
x	execute/list
```

## Permit others reading

```
chmod -R o+r *
```

## Do all in one call

```
# user can do all, group can read an execute, others can do nothing
chmod u=rwxs,g=rx,o=
```

## Setuid

* setuid sets the user id the programm/script will run when executed
* setuid is marked/set on the first three (user) area

## Fix file permissions errors on linux

```
#fetch user id
id --user

#list current path owner
sudo ls --numeric-uid-gid

#change ownership
sudo chown <user id> <path>

#change access
sudo chmod 755 <path>
```

### user web executes myprogramm

```
chmod u+s web /usr/bin/myprogramm
-rwsr-x-r--
1 web web 42312 Oct 06 1983 /usr/bin/myprogramm
```

## Setgid

* acts like the setuid but this time the group is used

```
chmod g+s web /usr/bin/myprogramm
```

## Stickybit

* by setting the stickybit, only the user who creates a file is allowed to delete it
* very usefull for temporary directories or general shared space
 
```
chmod +t
```

## Do not change target of symbolic links


```
#@see: https://utcc.utoronto.ca/~cks/space/blog/sysadmin/ChownSymlinkSafety
chmod -h
```

## Links

* [Fix file permission errors on linux](https://opensource.com/article/22/8/fix-file-permission-errors-linux) - 20220808
* [do a >>chown -hR<< instead of a >>chown -R<<.](https://utcc.utoronto.ca/~cks/space/blog/sysadmin/ChownSymlinkSafety)
* http://www.computerhope.com/unix/uchmod.htm
* https://en.wikipedia.org/wiki/Chmod
* http://catcode.com/teachmod/

