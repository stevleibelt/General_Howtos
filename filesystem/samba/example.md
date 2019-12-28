# example smb.conf file

## basic example

```
[global]
        workgroup = <WORKGROUP>
        server string = %h
        printcap name = /dev/null
        load printers = no
        printing = bsd
        log file = /var/log/sama/%m.log
        max log size = 50
        security = user
        dns proxy = no
        unix charset = UTF8
        hide dot files = no
        follow symlinks = no
        unix extensions = no
[yourshare]
        browsable = yes
        comment = <your_share_comment>
        create mask = 0775
        directory mask = 0775
        guest ok = no
        path = <path/to/the/root/you/want/to/share>
        read only = no
        valid users = <user_name_one>[,<user_name_two>[,...]]
        writeable = yes
```
