# Howto

* install [samba](https://wiki.archlinux.org/index.php/Samba)
* cd /var/samba
* wget "https://git.samba.org/samba.git/?p=samba.git;a=blob_plain;f=examples/smb.conf.default;hb=HEAD" -O smb.conf.default
* cp smb.conf.default smb.conf
* add something like the following to your config plus adapt was needed

```
[MASCHINNAME]
    comment = This is my supa dupa printer
    printer = m1234
    path = /var/spool/samba
    printing = cups
    printable = yes
    user client driver = yes
    guest ok = yes
    writable
```

# Link

* [Setting up Samba as a Print Server](https://wiki.samba.org/index.php/Setting_up_Samba_as_a_Print_Server) - 2020-01-14
* [Sharing via samba - wiki.archlinux.org](https://wiki.archlinux.org/index.php/CUPS/Printer_sharing#Sharing_via_Samba) - 2020-01-14
