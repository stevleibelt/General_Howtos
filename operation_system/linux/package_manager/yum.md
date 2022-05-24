# yum package manager

```bash
# list all packages in all repositories
yum list [all]

# list all available to install packages
yum list available

# list installed
yum list installed

# list installed but not covered by any repository software
yum list extras

# list obsolete packages (not needed by any installed package)
yum list obsolete

# check if updates are availalbe
yum check-update
yum list updates

# display information about specific package
yum info [package name]

# search in repositories
yum search [package name]

# download/cache metadata for currently enabled repostiroeis
yum makecache

# clean up cache for metadatas
yum clean [paadata, dbache, all] 

# install package
yum install [package name]

# install from local rpm
yum localinstall [package name]

# install only n-numbers of kernels
set in: /etc/yum/pluginconf.d/installonlyn.conf 
installonlyn = 3
to install only 3 kernel versions
```

## Links

* http://www.fedorasolved.org/Members/zcat/yum-rpm-faq
* http://yum.baseurl.org/wiki/YumCommands
* http://yum.baseurl.org/wiki/Guides

