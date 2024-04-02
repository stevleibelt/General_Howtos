# Samba

## Quick start

`cp /etc/samba/smb.conf.default /etc/samba/smb.conf`

### Add user

```bash
if [smbd -V >= 3.4.0]
    pdbedit -a -u <user name>
else
    smbpasswd -a <user name>
fi
```

### List users

```
pdbedit -L
```

### Edit user

```bash
pdbedit -t -r -u <user name>
#or
smbpasswd -s <user name>
```

### Set stickbit for ug

```bash
chmod -R ug+s <folder>
```

## smb.conf

### options

* browseable = no           -   service is seen or not
* create mask = 0765        -   file create mask
* directory mask = 0765     -   directory create mask
* dos charset = <charset>   -   charset for unix machins (dos charset = 850)
* follow symlinks = no      -   follow symbolic links
* force group = <name>      -   create files or directories with group <name>
* force user = <name>       -   create files or directories with user <name>
* guest ok = no             -   grant guest account access
* hide dot files = no       -   hide dot files
* include <path>            -   include configuration file
* path = <path>             -   path for the service
* printable = no            -   grant spool write access
* read list = foo,bar       -   list of users that have write access
* read only = no            -   service is read only (also by guests)
* unix charset = <charset>  -   charset for unix machins (unix charset = utf8)
* valid users = foo,bar     -   list of valid users
* wide links = no           -   allow system wide symbolic links
* write list = foo,bar      -   list of users that have write access
* writeable = no            -   service is writeable

### macros

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

## Smbclient

```bash
#<server name> can be the host name or the ip address
#list available (public) shares
smbclient -L <server name>

#add verbository, you have a debug level from 0 to 10
smbclient -d 5 -L <server name>

#list available user based shares
smbclient -L <server name> -U <user name>

#login to a share
smbclient \\\\<server name>\\<share>
```

## Mount share 

```bash
#per session
mount –t cifs <server name>/<share name> <local mount point> -o username=<user name>,domain=<work group>

#/etc/fstab
```

### Mounting with write permissions

```bash
#get the <user id> from console command "id"
#share will be mounted with permissions 755
#see: http://microitblog.com/micro-it-blog/2011/04/21/mounting-cifs-shares-through-linux-with-write-permissions
mount -t cifs <server name>/<share name> <local mount point> -o username=<user name>,uid=<user id>
```

### Options

* gid       -   group id on your client
* iocharset -   chaset (likeuicharset=utf8)
* uid       -   user id on your client
* username  -   username on the server
* workgroup -   workgroup on the server

## Simple howto

```bash
# based for debian
# https://wiki.debian.org/SambaServerSimple
apt-get samba samba-client
vim /etc/samba/smb.conf

# adapt
## workgroup = <YOUR WORKGROUP>
# share special path
## [yourname]
##    comment = your comment
##    create mask = 0700
##    directory mask = 0700
##    guest ok = no
##    locking = no
##    path = /path/to/the/files
##    read only = no
##    valid users = userone,usertwo

# validate configuration
#   testparm -s

# add the user
#   smbpasswd -a userone
# list existing users
#   pdbedit -w -L

# restart the service
#   /etc/init.d/samba restart

# add samba to the autostart
#   update-rc.d samba defaults
```

## Umask

### Example

```bash
create mask = 0664
directory mask = 0775
force create mode = 0664
force directory mode = 0775
```

## Speed / make it fast

```bash
####
#@see: https://www.samba.org/samba/docs/man/Samba3-HOWTO/speed.html
#@see: https://wiki.amahi.org/index.php/Make_Samba_Go_Faster 
####
#add the following options
#the options are orderd in a way of "what could bring you the most performance and less trouble" top down
####
#you can combine multiple options like
#socket options = TCP_NODELAY IPTOS_LOWDELAY
socket options = TCP_NODELAY    #default tryout ;-)
socket options = IPTOS_LOWDELAY #if your are on a lan
```

## Error handling

###  Unable to open printcap file /etc/printcap for read!

```bash
#add to smb.conf
#see: http://cmorse.org/blog/archives/142
[global]
   printcap name = /dev/null
   load printers = no
   printing = bsd
```

### Failed to delete pidfile /var/run/smbd.pid.

```bash
#see: https://bugs.archlinux.org/task/36338
```

### protocol negotiation failed: NT_STATUS_INVALID_NETWORK_RESPONSE

```bash
#see: https://wiki.archlinux.org/index.php/Samba/Troubleshooting#protocol_negotiation_failed:_NT_STATUS_INVALID_NETWORK_RESPONSE
comment out your "hosts allow"
```

### mount error(13): Permission denied

If you have tried it wot "mount -t cifs", try it with "mount.cifs".

## Links

* https://wiki.samba.org/
* https://www.samba.org/samba/docs/man/manpages-3/smb.conf.5.html
* https://www.samba.org/samba/docs/using_samba/ch08.html
* https://wiki.archlinux.org/index.php/Samba
* https://help.ubuntu.com/community/Samba/SambaServerGuide?highlight=%28%5CbCategoryNetworking%5Cb%29
* http://www.linuxhomenetworking.com/wiki/index.php/Quick_HOWTO_:_Ch10_:_Windows,_Linux,_and_Samba
* http://www.bodenzord.com/archives/53
* https://askubuntu.com/questions/210808/set-umask-set-permissions-and-set-acl-but-samba-isnt-using-those
* [Using the worm VFS Module](https://wiki.samba.org/index.php/Using_the_worm_VFS_Module) - 20240402
  * **W**rite **o**nce, **r**ead **m**any
  * Used to create a share where user can write into for a period of time before this change is turned to read-only
