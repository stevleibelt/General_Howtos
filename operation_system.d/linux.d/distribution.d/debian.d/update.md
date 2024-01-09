# Update your debian system

## Unattended updates

```bash
# ref: https://wiki.debian.org/UnattendedUpgrades
# as root
# optional! if available, remove all unneeded exim packages
apt purge exim*

apt install unattended-upgrades apt-listchanges bsd-mailx ssmtp
echo unattended-upgrades unattended-upgrades/enable_auto_updates boolean true | debconf-set-selections
dpkg-reconfigure -f noninteractive unattended-upgrades

dpkg-reconfigure -plow ssmtp
# artodeto@bazzline.net
# smtp.bazzline.net
# 25
# myhost.bazzline.net - if unknown, run hostname -f
# myhost.bazzline.net
# yes

# test
# end your content with . + ENTER
mail -s "Test email" root
```
