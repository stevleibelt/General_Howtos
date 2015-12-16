# error

## /var/spool/cups/tmp/.hplip'

All you have to do is go to the CUPS printer administration page and click "Resume Printer"

##  Paused - "Filter failed"

* install san
* uncomment hpaio in /etc/sane.d/dll.conf
* run **hp-check -t | grep -i error**

[source](https://bbs.archlinux.org/viewtopic.php?id=85454)
[image](http://blog.willygroup.org/wp-content/uploads/2011/02/cups.png)
