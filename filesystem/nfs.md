# server

## /etc/exports

### options

* ro    read only
* rw    read and write
* no_root_squash    -   root user on client acts as root user on server
* no_subtree_check  -   no verifiaction that file is in the tree (usefull if you export an entire volume to add some speed)
* insecure          -   use unprivileged ports (above 2014)
* fsid=0            -   indicates the virtual root (can be used only once)

## statistics

    nfsstat

# client

## mounting

    # via shell
    sudo mount <server>:/<path> <path>
    # at boot time
    # add to /etc/fstab
    server:/<path>  <path>  nfs4 _netdev    0   0

# links

* http://www.brennan.id.au/19-Network_File_System.html#nfs4
* http://wiki.gentoo.org/wiki/NFSv4
* http://linuxconfig.org/how-to-configure-nfs-on-linux
* http://www.cyberciti.biz/faq/centos-fedora-rhel-nfs-v4-configuration/
* https://wiki.archlinux.org/index.php/Nfs#Performance_tuning
* https://www.suse.com/communities/conversations/configuring-nfsv4-server-and-client-suse-linux-enterprise-server-10/
* http://www.gurkulindia.com/main/2011/03/linux-nfs4-configuration/
* https://help.ubuntu.com/community/NFSv4Howto
