# ACL

## Enable

* enable it in your zpool (if you are using zfs)
* enable it via "tune2fs -o acl /dev/sdXY"

## Get acl

```
#get help page
getfacl --help
#view current acl
getfacl <path>
#just get the facts
getfacl --omit-header <path>
```

## Set acl

```
setfacl --help
#remove all permissions
setfacl -b
#set all permissions for user <user name> to file named <path>
#you can use -m or --modify
setfacl --modify u:<user name>:rwx <path>
#set read and execute permissions for user <user name> to file named <path>
setfacl --modify u:<user name>:r-x <path>
#add user with user id 500
#   this is useful if your user "<user name>" has different user ids on different
#   machines
setfacl --modify u:500:rwx <path>
#set multiple user ids
setfacl --modify u:500:rwx,u:1000:rwx,u:<user name>:rwx <path>

#set default acl rules
setfacl --default --modify u:500:rwx <user name>

#set acl to an existing filesystem with many items
#   we separate directories and files to avoid setting the
#   executable bits to files too
#   following, we set the executable flags for directories
find <path> -type d | parallel --max-args=6 setfacl --default --modify u:500:rwx,u:1000:rwx
#   now we set the files without executable flag
find <path> -type f | parallel --max-args=6 setfacl --default --modify u:500:rw,u:1000:rw
```

## Links

* [Access Control List - archlinux.org](https://wiki.archlinux.org/index.php/Access_Control_Lists) - 20200330
* [Access Control List - wikipedia.org](https://en.wikipedia.org/wiki/Access_control_list) - 20200330
* [Access control lists and external drives on Linux: What you need to know - opensource.com](https://opensource.com/article/20/3/external-drives-linux) - 20200330

