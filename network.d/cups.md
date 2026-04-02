# CUPS

## Configuration

### Server

```bash
#allow access
vim /etc/cups/cupsd.conf
<Location />
    Order allow,deny
    Allow localhost
    Allow @LOCAL
    #allow for dedicated subnet
    #Allow from 192.168.0.
    #allow all
    #Allow all
</Location>
#check if the server is listen on the right ip address
Listen <hostname>:631
#allow for all in the supnet
Listen <host ip address>:631
```

## Error Handling

Set the `LogLevel` to `Debug` in `/etc/cups/cupsd.conf`.

### Printer is disabled / Unable to send data to printer. / The printer may not exist or is unavailable at this time

```bash
sudo systemctl restart cups
#check current state
sudo lptstat -p

#maybe needed
cupsenable <printer name>
```
_or_

* open `https://<cups server ip address or host name>:631`
* go to `Printers` -> `<printer>` -> `Maintenance` -> `Recume Printer`

## Cupsctl

```bash
#share printer with clients in the same subnet
cupsctl --share-printers
#share printer with clients from any subnet
cupsctl --share-printers --remote-any
```

## Error

### /var/spool/cups/tmp/.hplip'

All you have to do is go to the CUPS printer administration page and click "Resume Printer"

###  Paused - "Filter failed"

* install sane
* uncomment hpaio in /etc/sane.d/dll.conf
* run **hp-check -t | grep -i error**

[source](https://bbs.archlinux.org/viewtopic.php?id=85454)
[image](http://blog.willygroup.org/wp-content/uploads/2011/02/cups.png)

## Links

* [Arch Linux Install Network Printer: adamsdesk.com](https://kb.adamsdesk.com/operating_system/arch_linux_install_network_printer/) - 20260402
* [CUPS Command-Line Utilities on oracle.com](https://docs.oracle.com/cd/E23824_01/html/821-1451/gllgm.html)
* [cups printer for arch linux](https://wiki.archlinux.org/index.php/CUPS)
* [cups printer sharing](https://www.cups.org/doc/sharing.html)
* [cups printer sharing for arch linux](https://wiki.archlinux.org/index.php/CUPS/Printer_sharing)
* [cupsd.conf](https://www.cups.org/doc/man-cupsd.conf.html)
* [Diy quick and easy samba print server setup](https://www.techrepublic.com/blog/diy-it-guy/diy-quick-and-easy-samba-print-server-setup/) - 2020-02-18
* [How to resume CUPS printer from command line?](https://superuser.com/questions/280396/how-to-resume-cups-printer-from-command-line)
* [How to Set Up a Printer with CUPS on Arch Linux: siberoloji.com](https://www.siberoloji.com/how-to-set-up-a-printer-with-cups-on-arch-linux/) - 20260402
* [ipp based print server cups](https://www.howtoforge.com/ipp_based_print_server_cups) - 2020-02-18
* [Linux CUPS Tutorial for Beginners: A Comprehensive Guide to Printing on Linux: thelinuxvault.net](https://www.thelinuxvault.net/blog/linux-cups-tutorial-for-beginners/) - 20260402
* [lpadmin](https://www.cups.org/doc/man-lpadmin.html)
* [network printing with ubuntu](https://help.ubuntu.com/community/NetworkPrintingWithUbuntu)
* [what is cups server and how to share a printer](https://askubuntu.com/questions/73367/what-is-cups-server-and-how-to-share-a-printer-locally-or-over-a-network)
