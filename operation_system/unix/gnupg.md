# moving from one installation to an other

* simple copy the directory

```
cp -r --preserve=timestamp,mode <source>/.gnupg <target>/.gnupg
```

# error

Most important, retry your command with verbositiy by adding "-vvv --debug-all".
Sadly but true, for every error it is always a good tryout to remove the ".gnupg" directory in your home path.

## gpg: keyserver receive failed: No keyserver available

```
#e.g. pgp.mit.edu
gpg --keyserver <key server name> --recv-keys <key>
```

# links

* https://wiki.archlinux.org/index.php/Gnupg
* http://www.phildev.net/pgp/gpg_moving_keys.html
