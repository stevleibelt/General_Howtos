# Mount SSHFS by using a wsl 2 debian linux machine

Given is, that you need to mount a filesystem via sshfs.

Following up, I will provide a guide how to do this by using a Windows 10 machine.

Bonus task, we are using a jumphost.

## Steps

### 1.) Ensure you are running wsl2

* wsl1 does not have a working fuse
* Open a powershell and run `wsl --list --verbose`
* If the VERSION says something bigger 1, you are fine
* Else
  * `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`
  * `Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform`
  * Download `wsl_update_x64.msi` from [https://aka.ms/wsl2kernel](https://aka.ms/wsl2kernel)
  * Install the msi
  * `wsl --set-version <string: Distro like Debian> 2`
  * Wait
  * `wsl --list --verbose` should output something like 2 in column `VERSION`

### 2.) Ensure you've sshfs installed

* Open the shell to your wsl linux
* `test -f /usr/bin/sshfs && echo "sshfs already installed" || sudo apt install sshfs -y`

### 3.) Configure your ssh

* Open the shell to your wsl linux
* `test -d ~/.ssh || mkdir ~/.ssh;`
* Add content like the following in your `~/.ssh/config` file
* `sudo bash -c "echo '#enable option' >> /etc/fuse.conf"`
* `sudo bash -c "echo 'user_allow_other' >> /etc/fuse.conf"`

#### Example content of the ssh config file

```ssh
HOST my.main.host-username
  HostName my.main.host
  ProxyJump my.bastion.host-username
  User username
  #optional but recommended
  IdentityFile ~/.ssh/my_private_key

HOST my.bastion.host-username
  HostName my.bastion.host
  User username
  #optional but recommended
  IdentityFile ~/.ssh/my_private_key

```

### 4.) Mount and umount the filesystem

* You can add the following lines to your alias
* Assumed is, that the path `~/network/host.main.my` exists
* `ssh my.main.host-username`
* `id -a`
* `exit`
* Not down the number for `uid` and `gid`
  * Example:
    * For the output `uid=1337(artodeto) gid=4711(bazzline) groups=...`
    * uid is `1337`
    * gid is `4711`
* mount: `sshfs -o ProxyJump=my.bastion.host-username,allow_other,uid=<int: number>,gid=<int: number> my.main.host-username:/my/path ~/network/host.main.my`

