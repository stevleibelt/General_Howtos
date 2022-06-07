# Example smb.conf file

## Basic example

Assuming you want so share something like the following directory structure, you should use the ownerships and permissions like the following.

```
#<path> <ownership:<user_name>,<group_name>> <permissions>
/mnt/my_share root,root 755
/mnt/my_share/home/user_name_one usernameone,user_name_one 700
/mnt/my_share/home/user_name_two usernametwo,user_name_two 700
/mnt/my_share/media root,smbstoragerm 775
/mnt/my_share/media/audio root,smbstoragerm 775
/mnt/my_share/media/image root,smbstoragerm 775
/mnt/my_share/media/video root,smbstoragerm 775
/mnt/my_share/media/video root,smbstoragerm 775
/mnt/my_share/temporary root,smbstoragerm 777
```

```
#create dedicated read and write samba group
<my_samba_group_rw>

#create user that has no home directory and can not log in
useradd -r -s /usr/bin/nologin -g <my_samba_group_rw> <user_name_one>

#set password
passwd <user_name_one>

#add user to samba
smbpasswd -a <user_name_one>
```

```
#create file /etc/samba/smb.conf
[global]
        workgroup = <WORKGROUP>
        server string = %h
        printcap name = /dev/null
        load printers = no
        printing = bsd
        log file = /var/log/samba/%m.log
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

