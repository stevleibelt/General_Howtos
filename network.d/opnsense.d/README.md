# Opnsense

## General notes

* Default password for `root` and `installer` is `opnsense`
* Show ip configuration: `ipconfig`
* Mount usb
  * List available disks: `ls /dev/da*`
  * Create mount target: `mkdir /media/usb`
  * Mount usb: `mount_msdosfs /dev/da0s1 /media/usb`
* Check disk: `fsck -fy /`
  * Give it a try if you need sudo or not
* You can use [serial console](../../operation_system/unix/tty.md) if needed

## List of HowTo's

* [Enable 2FA Authentication](howto/enable_2fa_authentication.md)
* [Setup DNS](howto/setup_dns.md)
* [Setup Dynamic DNS - nsupdate](howto/setup_dynamic_dns.md)
* [Setup OpenVPN](howto/setup_openvpn.md)
* [Setup Telekom FTTH](howto/setup_telekom_ftth.md)
* [Setup Wireguard](howto/setup_wireguard.md)

## Possible usefull plugins

* [clamav](https://docs.opnsense.org/manual/how-tos/clamav.html) - 20230213
* [git-backup](https://docs.opnsense.org/manual/git-backup.html) - 20230213
* [ntopng](https://docs.opnsense.org/manual/how-tos/ntopng.html) - 20230213
* [tor](https://docs.opnsense.org/manual/how-tos/tor.html) - 20230213
* [wireguard](https://docs.opnsense.org/manual/how-tos/wireguard-client.html) - 20230213

## Update

### From cli

First, you need to enable ssh and sudo support for your cli user.

Go to `System -> Settings -> Administration` and search for `sudo`.
See `https://<opnsense ip>/system_advanced_admin.php`.
Set `ask for password` and add the group `admins` to it.

Furthermore, you need to create a user. (`https://<opnsense ip>/system_usermanager.php`)

```bash
ssh <user>@<opnsense ip>
#if needed
#give it a try if you need sudo or not
sudo /usr/local/sbin/opnsense-shell

#if you run into the issue >>A firmware action is currently in progress.<<
#  (of course only if there is no upgrade in progress)
sudo pkg update -f
#to reinstall all packages
sudo pkg upgrade -f
#just for new ones
sudo pkg upgrade -f
```

## Link

* [opnsense](http://opnsense.org/) - 20211028
