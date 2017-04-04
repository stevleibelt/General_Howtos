# znc is a irc bouncer

## install howto (for uberspace.de)

```
mkdir -p data/znc.git
mkdir -p bin/znc
cd znc.git
git clone git://github.com/znc/znc.git .
./autogen.sh
./configure --prefix=$HOME/bin/znc
make
make install
cd ${HOME}
```

## configure

```
cd $HOME
test -d ~/service || uberspace-setup-svscan
bin/znc --makeconf
#port 64321

cat << __EOF__ >> ~/bin/znc-daemon
#!/bin/sh
exec $HOME/bin/znc/bin/znc --foreground --debug 2>&1
__EOF__
chmod +x ${HOME}/bin/znc-daemon
uberspace-setup-service znc-daemon ${HOME}/bin/znc-daemon
```

## connect via ssh

```
ssh -f -L 64321:localhost:64321 <username>@<server>.uberspace.de -N
```

# links

* [on uberspace](https://marvindickhaus.de/2013/08/irc-bouncer-znc-auf-dem-uberspace-nutzen/)
* [faq](http://wiki.znc.in/FAQ)
* [modules](http://wiki.znc.in/Modules)
* [homepage](http://wiki.znc.in/ZNC)
