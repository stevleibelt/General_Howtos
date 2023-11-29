# Portstree

```bash
#install
portsnap fetch extract

#update
portsnap fetch update

#search
whereis $tool
locate $tool
http://www.freshports.org

#get software needs to be updated
pkg_version -l "<"

#update all ports using portupgrade -r
portupgrade -r <port>

#validate installed ports
portaudit -Fda

#remove unneeded ports
pkg_cutleaves

#good to know
##rehash your shell environment after installation
rehash
##speed up by installing compiler-cache
devel/ccache
##add following lines to /etc/make.conf
.if (!empty(.CURDIR:M/usr/src*) || !empty(.CURDIR:M/usr/obj*))
        .if !defined(NOCCACHE)
                CC:=${CC:C,^cc,%%PREFIX%%/%%CCLINKDIR%%/world/cc,1}
                CXX:=${CXX:C,^c\+\+,%%PREFIX%%/%%CCLINKDIR%%/world/c++,1}
        .endif
.endif
```
