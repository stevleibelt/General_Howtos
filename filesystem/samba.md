# cp /etc/samba/smb.conf.default /etc/samba/smb.conf

    if [smbd -V >= 3.4.0]
      pdbedit -a -u <user>
    else
      smbpasswd -a <user>
    fi

# set stickbit for ug

    chmod -R ug+s <folder>

# links

* https://www.samba.org/samba/docs/man/manpages-3/smb.conf.5.html
* https://wiki.archlinux.org/index.php/Samba
* https://help.ubuntu.com/community/Samba/SambaServerGuide?highlight=%28%5CbCategoryNetworking%5Cb%29
