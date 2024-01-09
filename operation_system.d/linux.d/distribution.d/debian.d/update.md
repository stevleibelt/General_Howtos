# Update your debian system

## Unattended updates

```bash
# ref: https://wiki.debian.org/UnattendedUpgrades
# as root
apt install unattended-upgrades apt-listchanges bsd-mailx
echo unattended-upgrades unattended-upgrades/enable_auto_updates boolean true | debconf-set-selections
dpkg-reconfigure -f noninteractive unattended-upgrades

# if available, remove all unneeded exim packages
apt purge exim*

apt install ssmtp

dpkg-reconfigure -plow ssmtp
# artodeto@bazzline.net
# smtp.bazzline.net
# 25
# myhost.bazzline.net
# myhost.bazzline.net
# yes

apt install bsd-mailx

# test
# end your content with . + ENTER
mail -s "Test email" root
```
