# quick start

* cp /etc/samba/smb.conf.default /etc/samba/smb.conf

## add user

    if [smbd -V >= 3.4.0]
        pdbedit -a -u <user>
    else
        smbpasswd -a <user>
    fi

## list users

    pdbedit -L

## set stickbit for ug

    chmod -R ug+s <folder>

# smb.conf

## options

* browseable = no       -   service is seen or not
* create mask = 0765    -   file create mask
* directory mask = 0765 -   directory create mask
* follow symlinks = no  -   follow symbolic links
* force group = <name>  -   create files or directories with group <name>
* force user = <name>   -   create files or directories with user <name>
* guest ok = no         -   grant guest account access
* hide dot files = no   -   hide dot files
* include <path>        -   include configuration file
* path = <path>         -   path for the service
* printable = no        -   grant spool write access
* read list = foo,bar  -   list of users that have write access
* read only = no        -   service is read only (also by guests)
* valid users = foo,bar -   list of valid users
* wide links = no       -   allow system wide symbolic links
* write list = foo,bar  -   list of users that have write access
* writeable = no        -   service is writeable

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

# smbclient

    #<server name> can be the host name or the ip address
    #list available (public) shares
    smbclient -L <server name>

    #list available user based shares
    smbclient -L <server name> -U <user name>

    #login to a share
    smbclient \\\\<server name>\\<share>

# mount share 

    #per session
    mount –t cifs <server name>/<share name> <local mount point> –o username=<user name>,workgroup=<work group>

    #/etc/fstab

## options

* gid       -   group id on your client
* uid       -   user id on your client
* username  -   username on the server
* workgroup -   workgroup on the server

# links

* https://www.samba.org/samba/docs/man/manpages-3/smb.conf.5.html
* https://www.samba.org/samba/docs/using_samba/ch08.html
* https://wiki.archlinux.org/index.php/Samba
* https://help.ubuntu.com/community/Samba/SambaServerGuide?highlight=%28%5CbCategoryNetworking%5Cb%29
* http://www.linuxhomenetworking.com/wiki/index.php/Quick_HOWTO_:_Ch10_:_Windows,_Linux,_and_Samba
