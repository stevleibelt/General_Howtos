# dpkg | apt

## errors

###  too-long line or missing newline in `/var/lib/dpkg/

```
dpkg: unrecoverable fatal error, aborting:
  too-long line or missing newline in `/var/lib/dpkg/<your package name>
```

```
#solution
# delete package.list file
rm /var/lib/dpkg/info/<your package name>.list
apt-get install <your package name> --reinstall
```

[source](http://raspberrypi.stackexchange.com/questions/4245/unable-to-use-apt-get-dpkg-unrecoverable-fatal-error-is-missing-final-newl)
