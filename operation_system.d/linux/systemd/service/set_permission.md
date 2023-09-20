# Example how to set permission

[This](https://www.underkube.com/posts/2022-02-21-using-systemd-path-to-keep-folder-permissions/) article inspired me in writing this.

## Audit first

First of all, you should use [auditd](https://linuxhint.com/auditd_linux_tutorial/) to check why you have to setup the sytemd-path.

```
sudo auditctl -w <path to watch> -k <keyword> -p <permission>
#as example: sudo auditctl -w /var/lib/libvirt/images -k libvirt-images -p a

#after a while, perform asearch
sudo ausearch -ts <timespn> -k <keyword> -i
#as example: sudo ausearch -ts today -k libvirt-images -i

#you can list all available rules with
auditctl -l

#you can remove your rule with
auditctl -d <int>
```

## Create systemd-path

```
#create script that does the chmod
export NAME="fix-libvirt-images-permissions"
cat > /usr/local/bin/${NAME}.sh <<DELIM
#!/bin/bash
USER='core'
FOLDER='/var/lib/libvirt/images'

chmod 711 ${FOLDER}
setfacl -m u:${USER}:rwx "${FOLDER}"
DELIM

#make the script executable
chmod 755 /usr/local/bin/${NAME}.sh

#create the systemd.service to execute the script from above
cat > /etc/systemd/system/${NAME}.service <<DELIM
[Unit] 
Description="Run script to restore permissions"

[Service]
ExecStart=/usr/local/bin/${NAME}.sh
DELIM

#and finally the systemd.path file that executes the systemd.service
# on a path change
cat > /etc/systemd/system/${NAME}.path <<DELIM
[Unit]
Description="Monitor /var/lib/libvirt/images permissions"

[Path]
PathChanged=/var/lib/libvirt/images
Unit=${NAME}.service

[Install]
WantedBy=multi-user.target
DELIM

#reload systemd and enable systemd.path unit
systemctl daemon-reload
systemctl enable --now ${NAME}.path
```
