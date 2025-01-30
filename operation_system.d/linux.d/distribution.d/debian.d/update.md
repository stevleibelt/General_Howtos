# Update your debian system

## Unattended updates

```bash
# ref: https://wiki.debian.org/UnattendedUpgrades
# as root
# optional! if available, remove all unneeded exim packages
apt purge exim*

apt install unattended-upgrades apt-listchanges bsd-mailx msmtp msmtp-mta
echo unattended-upgrades unattended-upgrades/enable_auto_updates boolean true | debconf-set-selections
dpkg-reconfigure -f noninteractive unattended-upgrades

cat > /etc/apt/apt.conf.d/52unattended-upgrades-local <<DELIM
// Send E-Mails to
Unattended-Upgrade::Mail "root";

// Send E-Mails when upgrade results in error 
Unattended-Upgrade::MailReport "only-on-error";
DELIM


cat > /etc/msmtprc <<DELIM
# ref: /usr/share/doc/msmtp/examples/msmtprc-user.example
defaults
port 25
tls on
tls_starttls on

account tubaf
host smtp.bazzline.net
from myuser@myhost.bazzline.net

account default: tubaf
DELIM

# test
# end your content with . + ENTER
mail -s "Test email" <string: sent_to_email_address> <<DELIM
This is a content
DELIM
```

## Links

* [Unattended Upgrades - wiki.debian.org](https://wiki.debian.org/UnattendedUpgrades) - 20240409
