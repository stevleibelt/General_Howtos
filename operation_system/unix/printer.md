# convert/prepare files for printing

```
pr $file
```

# produce $k columns of output

```
pr -k <path to the file>
```

# add header

```
pr -h "<my header text>" <path to the file>
```

# print a file

```
lp or lpr
```

# use not the default printer

```
lpr -d$printername
```

# print $n copies

```
lp -n<number of copies>
lpr -<number of copies>
```

# list available printers

```
lpinfo -v
```

# list configured printers

```
lpstat -a
```

# delete a printer

```
lpadmin -x <identifier>
```

# set printer as default printer

```
lpoptions -d <identifier>
```

# links

* https://wiki.archlinux.org/index.php/CUPS#Printers
* http://www.openprinting.org/printers
