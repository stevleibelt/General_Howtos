# configuration

## server

```
#allow access
vim /etc/cups/cupsd.conf
<Location />
    Order allow,deny
    Allow localhost
    Allow 192.168.0.*
</Location>
#check if the server is listen on the right ip address
Listen <hostname>:631
```

# cupsctl

```
#share printer with clients in the same subnet
cupsctl --share-printers
#share printer with clients from any subnet
cupsctl --share-printers --remote-any
```


# error

## /var/spool/cups/tmp/.hplip'

All you have to do is go to the CUPS printer administration page and click "Resume Printer"

##  Paused - "Filter failed"

* install sane
* uncomment hpaio in /etc/sane.d/dll.conf
* run **hp-check -t | grep -i error**

[source](https://bbs.archlinux.org/viewtopic.php?id=85454)
[image](http://blog.willygroup.org/wp-content/uploads/2011/02/cups.png)

# link

* [cups printer sharing](https://www.cups.org/doc/sharing.html)
* [lpadmin](https://www.cups.org/doc/man-lpadmin.html)
* [cups printer sharing arch linux](https://wiki.archlinux.org/index.php/CUPS/Printer_sharing)
* [what is cups server and how to share a printer](https://askubuntu.com/questions/73367/what-is-cups-server-and-how-to-share-a-printer-locally-or-over-a-network)
* [network printing with ubuntu](https://help.ubuntu.com/community/NetworkPrintingWithUbuntu)
