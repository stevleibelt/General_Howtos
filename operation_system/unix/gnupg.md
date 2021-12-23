# moving from one installation to an other

* simple copy the directory

```
cp -r --preserve=timestamp,mode <source>/.gnupg <target>/.gnupg
```

# error

Most important, retry your command with verbositiy by adding "-vvv --debug-all".
Sadly but true, for every error it is always a good tryout to remove the ".gnupg" directory in your home path.

## gpg: WARNING: Tor is not running

Read [this](https://dev.gnupg.org/T4465) if you want to know more.

```
echo "no-use-tor" >> ~/.gnupg/dirmngr.conf
```

## gpg: keyserver receive failed: No keyserver available

```
#e.g. pgp.mit.edu
gpg --keyserver <key server name> --recv-keys <key>
#behind a proxy
gpg --keyserver <key server name> --keyserver-options http-proxy=http://<ip of the proxy>[:<port>] --recv-keys <key>
#e.g. gpg --recv-keys --keyserver hkp://pgp.mit.edu 865E6C87C65285EC
```

# links

* https://wiki.archlinux.org/index.php/Gnupg
* http://www.phildev.net/pgp/gpg_moving_keys.html
