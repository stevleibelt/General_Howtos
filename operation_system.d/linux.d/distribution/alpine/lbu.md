# general

lbu takes care of files below "/etc" by default.
Configure it via "/etc/lbu/lbu.conf".

```
#commit changes
lbu commit [-dnpv] [<media>]

#check status
lbu status [-av]

#include other files
lbu include [-lrv] <file>

#exclude other files
lbu exclude [-lrv] <file>

#list available backups
lbu list-backup [<media>]

#revert
lbu revert <filename> [<media>]
```

# link

* https://wiki.alpinelinux.org/wiki/Alpine_local_backup
