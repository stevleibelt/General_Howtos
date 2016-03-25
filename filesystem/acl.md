# enable

* enable it in your zpool (if you are using zfs)
* enable it via "tune2fs -o acl /dev/sdXY"

# get acl

```
getfacl --help
getfacl <name>
```

# set acl

```
setfacl --help
#remove all permissions
setfacl -b
#set all permissions for user foo to file named bar
setfacl -m "u:foo:rwx" bar
#set read and execute permissions for user foo to file named bar
setfacl -m "u:foo:r-x" bar

```

# links

* https://wiki.archlinux.org/index.php/Access_Control_Lists
* http://www.vanemery.com/Linux/ACL/linux-acl.html
* https://en.wikipedia.org/wiki/Access_control_list
