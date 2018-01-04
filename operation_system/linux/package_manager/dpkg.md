# dpkg

## list all packages on the system

```
dpkg -l
```

## dpkg list status explained

It is pretty hard to understand the headline of dpkg list at the beginning.
The man page of dpkg-query contains all needed information.

```
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name ... Version ... Architecture ... Description
+++-=...=-=...=-=...=-=...=
```

The first "+" stands for the desired package status.
The second "+" stands for the current package status.
The third "+" stands for the current package error flag.

The desired package status can be:
* u = unknown
* i = install
* h = hold
* r = remove
* p = purge

The current package status can be:
* n = not-installed
* c = config-files
* H = half-installed
* U = unpacked
* F = half-configured
* W = triggers-awaiting
* t = triggers-pending
* i = installed

The current package error flag can be:
* <empty> = no error (default)
* R = reinst-required

## list installed packages

```
dpkg -l | grep 'ii  '
#or
dpkg --get-selections
#or just for packages with the name "xyz"
dpkg --get-selections | grep xyz
```

## check current package status

```
dpkg --audit
```

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

# link

* [dpkg basic cheat sheet](https://www.cyberciti.biz/howto/question/linux/dpkg-cheat-sheet.php)
* [deal with dpkg unrecoverable fata error](http://raspberrypi.stackexchange.com/questions/4245/unable-to-use-apt-get-dpkg-unrecoverable-fatal-error-is-missing-final-newl)
* [dpkg list status output explained](https://askubuntu.com/questions/735711/what-does-ii-mean-in-dpkg-list-command-output#735714)
* [dpkg on english wikipedia](https://en.wikipedia.org/wiki/Dpkg)
