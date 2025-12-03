# Update your debian system

## Unattended updates

You can perform a dry run after each changes with `sudo unattended-upgrades --dry-run --debug`.

```bash
# ref: zcat /usr/share/doc/unattended-upgrades/README.md.gz | less
# ref: /usr/share/doc/unattended-upgrades/README.md | less
# ref: https://wiki.debian.org/UnattendedUpgrades
# as root
# optional! if available, remove all unneeded exim packages
apt purge exim*

apt install unattended-upgrades apt-listchanges bsd-mailx msmtp msmtp-mta
echo unattended-upgrades unattended-upgrades/enable_auto_updates boolean true | debconf-set-selections
dpkg-reconfigure -f noninteractive unattended-upgrades

cat > /etc/apt/apt.conf.d/52unattended-upgrades-local <<DELIM
// Fetch available one by running `apt-cache policy`
//   check for `o=` and `a=` fields
// `a=` is the `${distro_codename}` that can be found in `lsb_release -c`
// `o=` is the `${distro_id}` that can be found in `lsb_release -i`
// By default, only updates from security and update repository are
//   processed
// ref: https://linuxcapable.com/how-to-configure-unattended-upgrades-on-debian-linux/
Unattended-Upgrade::Allowed-Origins {
//      "${distro_id}:${distro_codename}";
      "${distro_id}:${distro_codename}-security";
      "${distro_id}:${distro_codename}-updates";
//      "${distro_id}:${distro_codename}-proposed";
//      "${distro_id}:${distro_codename}-backports";
// Enables automatic updating of docker
// ref: https://dimasmaulana.dev/posts/development/unanttended-upgrade-docker/
//      "Docker:${distro_codename}";
}

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
