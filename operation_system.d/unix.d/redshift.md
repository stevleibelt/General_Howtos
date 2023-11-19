# example

```
####
#put the following lines in your ~/.xinitrc
#the used latitude and longitude are the one from Freiberg (Saxony/Germany)
####

#@link https://wiki.archlinux.org/index.php/Redshift
pgrep redshift &> /dev/null || redshift -l 50.91089:13.33881 &> /dev/null &

####
#and finally your line to start the window manager
###
exec i3
```
