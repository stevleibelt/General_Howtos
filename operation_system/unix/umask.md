# display current umask

```
cd <my path>
umask
#display human readable / symbolically mode
umask -S
```

# octal codes

0   -   any permission may be set
1   -   setting of execution permission forbidden
2   -   setting of write permission forbidden
3   -   setting of write and execution permission forbidden
4   -   setting of read permission forbidden
5   -   setting of read and execution permission forbidden
6   -   setting of read and write permission forbidden
7   -   setting of all permission forbidden

# symbolic codes

u   -   user
g   -   group
o   -   other
a   -   all
r   -   read
w   -   write
x   -   execute
X   -   special execute
s   -   setuid/gid
t   -   sticky

# operatior

+   -   enable
-   -   disable
=   -   enable provided and disable not provided

# links

* https://en.wikipedia.org/wiki/Umask
