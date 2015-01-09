# cp /etc/samba/smb.conf.default /etc/samba/smb.conf

    if [smbd -V >= 3.4.0]
      pdbedit -a -u <user>
    else
      smbpasswd -a <user>
    fi

# set stickbit for ug

    chmod -R ug+s <folder>
