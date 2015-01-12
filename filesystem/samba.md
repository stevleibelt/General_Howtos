# cp /etc/samba/smb.conf.default /etc/samba/smb.conf

    if [smbd -V >= 3.4.0]
      pdbedit -a -u <user>
    else
      smbpasswd -a <user>
    fi

# set stickbit for ug

    chmod -R ug+s <folder>

# smb.conf

## options

* path = <path>         -   path for the service
* read only = no        -   
* browseable = no       -   service is seen or not
* hide dot files = no   -   hide dot files
* follow symlinks = no  -   follow symbolic links

## macros

* %U    -   the username (the client wanted, not the same as they got on the system)
* %G    -   primary group of %U
* %h    -   hostname of the samba server
* %L    -   netbios name of the server
* %m    -   netbios name of the client
* %M    -   internet name of the client machnine
* %R    -   protocol
* %d    -   process id of the server
* %a    -   architecture of the client
* %I    -   ip address of the client
* $T    -   current date and time
* %D    -   domain or workgroup
* %w    -   winbind separator
* %S    -   name of the current service
* %P    -   root directory of the current service
* %u    -   username of the current service
* %g    -   primary group of %u
* %H    -   home directory of %u

# links

* https://www.samba.org/samba/docs/man/manpages-3/smb.conf.5.html
* https://wiki.archlinux.org/index.php/Samba
* https://help.ubuntu.com/community/Samba/SambaServerGuide?highlight=%28%5CbCategoryNetworking%5Cb%29
