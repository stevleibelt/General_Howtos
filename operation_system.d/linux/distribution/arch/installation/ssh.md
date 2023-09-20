# Install Arch Linux via SSH

## Steps

* boot from live image
* on the remote/target machine
  * check your ip: `ip a`
  * set root password: `passwd`
  * check that root login is allowed in the ssh config: `cat /etc/ssh/sshd_config | grep PermitRootLogin`
    * if not, set the value to `yes`
  * start ssh service: `systemctl start sshd.service`
  * check status of the ssh service: `systemctl status sshd.service`
* on your locale/source machine
  * try to "ssh" in the machine: `ssh root@<ip address of the remote machine>`
  * the live image comes with `screen`, so use it!

## Link

* [Install Arch Linux via SSH](https://wiki.archlinux.org/index.php/Install_Arch_Linux_via_SSH) - 20210129

