# Install Software

```bash
#take a look to portstree
#example by installing "sudo"
##compile and install it
cd /usr/ports/security/sudo
make install clean
##configure it
visudo -f /usr/local/etc/sudoers
##remove configuration after wrong installation
make rmconfig
#show config
make showconfig

#manpage for ports
man ports

#list installed ports
pkg_info

#update/upgrade
portupgrade -r $portOne [$portTwo ...]

#uninstall
pkg_delete -r $port
```
