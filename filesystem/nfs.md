# server

## example

```
#we are sharing "/mnt/my_data"
#nfs4 root is "/srv/nfs4"

mkdir -p /srv/nfs4/data

#mount for testing
mount --bind /mnt/my_data /srv/nfs/data

#mount per reboot
echo "/mnt/my_data /srv/nfs/data    none    bind    0   0" > /etc/fstab

echo " /srv/nfs/data <ip address>/<subnet>(rw,fsid=root,no_subtree_check)

#reload /etc/exports
exportfs -rav

vim /etc/conf.d/nfs-server.conf 
#run nfs-4 only
    NFSD_OPTS="-N 2 -N 3"
systemctl start nfs-server.service
```

## /etc/exports

### options

* ro    read only
* rw    read and write
* no_root_squash    -   root user on client acts as root user on server
* no_subtree_check  -   no verifiaction that file is in the tree (usefull if you export an entire volume to add some speed)
* insecure          -   use unprivileged ports (above 2014)
* fsid=0            -   indicates the virtual root (can be used only once)

## statistics

```
nfsstat
```

# client

## mounting

```
# via shell
sudo mount <server>:/<path> <path>
# at boot time
# add to /etc/fstab
server:/<path>  <path>  nfs4 _netdev    0   0
```

# problems

## Can i mount with different user id or group id?

Looks like this is not possible with nfs4.

## "Mounting a directory using nfs version4" on debian 7

replace your bindings in "/etc/exports" with "<ip>(rw,insecure). 
[source](http://www.unix.com/302873603-post8.html)

# links

* https://wiki.archlinux.org/index.php/NFS
* https://www.howtoforge.com/install_nfs_server_and_client_on_debian_wheezy
* https://www.howtoforge.com/nfs-server-and-client-debian-etch
* http://xmodulo.com/how-to-mount-nfs-share-as-regular-user.html
* http://www.brennan.id.au/19-Network_File_System.html#nfs4
* http://wiki.gentoo.org/wiki/NFSv4
* http://linuxconfig.org/how-to-configure-nfs-on-linux
* http://www.cyberciti.biz/faq/centos-fedora-rhel-nfs-v4-configuration/
* https://www.suse.com/communities/conversations/configuring-nfsv4-server-and-client-suse-linux-enterprise-server-10/
* http://www.gurkulindia.com/main/2011/03/linux-nfs4-configuration/
* https://help.ubuntu.com/community/NFSv4Howto
