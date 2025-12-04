# Systemd-logind

## General Information

* You can monitor the logind handled events by running `sudo journalctl -f --unit=systemd-logind`
* The cli utility is named `loginctl`
* Core file is located in `/etc/systemd/logind.conf`
* You can overwrite things by creating files in `/etc/systemd/logind.conf.d`
* You can apply your changes by `systemctl reload systemd-logind.service`

## Prevent suspend when lid is closed while connected to external power

Valid options for each action are:

* `halt`
* `hibernate`
* `hybrid-sleep`
* `ignore`
* `poweroff`
* `reboot`
* `suspend`
* `suspend-then-hibernate`

```bash
cat > /etc/systemd/logind.conf.d/handle_lid_switch.conf <<DELIM
[Login]
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore
DELIM
```

## Links

* [Power management: archlinux.org](https://wiki.archlinux.org/title/Power_management) - 20251203
* http://www.freedesktop.org/software/systemd/man/logind.conf.html
* http://www.freedesktop.org/software/systemd/man/loginctl.html
