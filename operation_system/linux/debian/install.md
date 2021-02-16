# error solving

## debbootstrap stops with "Error executing gpgv to check Release signature"

### the error

```
root@debian:/# debootstrap buster /mnt
I: Target architecture can be executed
I: Retrieving Release.gpg
I: Checking Release signature
E: Error executing gpgv to check Release signature
root@debian:/# client_loop: send disconnect: Connection reset by peer
```

### the solution

[source](https://serverfault.com/questions/984604/debootstrap-release-signed-by-unknown-key/984605#984605)

```
#download keys for buster
#import keys and create new keyring
wget https://ftp-master.debian.org/keys/release-10.asc -qO- | gpg --import --no-default-keyring --keyring ./debian-release-10.gpg
#call debootstrap again by using the new keyring
debootstrap --keyring=./debian-release-10.gpg buster /srv/buster
```

# links

* [german wiki page](http://linuxwiki.de/Debian/Installation)
