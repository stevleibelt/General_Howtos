# PGP/GNUPG

Depending on your installation, there is a chance that you have to replace `gpg` with `gpg2`.

## How To's

### Create a key pair

```bash
gpg --full-generate-key
```

### List keys

```bash
gpg --list-secret-keys
```

### Add notation

```bash
#typical values are
#   uid 1
#   primary user
#   notation
#   save
gpg --edit-key <string: key_fingerprint>
```

### Export key

```bash
gpg --armor --export <string: key_fingerprint> > pubkey.asc
```

### Moving from one installation to an other

* simple copy the directory

```bash
cp -r --preserve=timestamp,mode <source>/.gnupg <target>/.gnupg
```

## Errorhandling

Most important, retry your command with verbositiy by adding "-vvv --debug-all".
Sadly but true, for every error it is always a good tryout to remove the ".gnupg" directory in your home path.

### gpg: WARNING: Tor is not running

Read [this](https://dev.gnupg.org/T4465) if you want to know more.

```bash
echo "no-use-tor" >> ~/.gnupg/dirmngr.conf
```

### gpg: keyserver receive failed: No keyserver available

```bash
#e.g. pgp.mit.edu
gpg --keyserver <key server name> --recv-keys <key>
#behind a proxy
gpg --keyserver <key server name> --keyserver-options http-proxy=http://<ip of the proxy>[:<port>] --recv-keys <key>
#e.g. gpg --recv-keys --keyserver hkp://pgp.mit.edu 865E6C87C65285EC
```

## Links

* https://wiki.archlinux.org/index.php/Gnupg
* http://www.phildev.net/pgp/gpg_moving_keys.html
* [6 steps to get verified on Mastodon with encrypted keys](https://opensource.com/article/22/12/verified-mastodon-pgp-keyoxide) - 20221205
* [keys.openpgp.org](https://keys.openpgp.org/)

