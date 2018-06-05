# configure samba share

```
#/media is the root path where we want to link the share into it
sudo echo "/media /etc/autofs/auto.<server name> --timeout=60 --ghost\n" >> /etc/autofs/auto.master
#<local mount name> is the directory name inside /media that is created to link the real share into it
sudo echo "<local mount name> -fstype=cifs[,<other options>] ://<server name>/<server share>\n" > /etc/autofs/auto.<server name>
```

# links

* [arch linux wiki](https://wiki.archlinux.org/index.php/Autofs)
