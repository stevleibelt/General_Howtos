# Systemd-logind

## General Information

* The cli utility is named `loginctl`
* Core file is located in `/etc/systemd/logind.conf`
* You can overwrite things by creating files in `/etc/systemd/logind.conf.d`
* You can apply your changes by `systemctl reload systemd-logind.service`

## Prevent suspend when lid is closed while connected to external power

```bash
cat > /etc/systemd/logind.conf.d/handle_lid_switch_external_power.conf <<DELIM
HandleLidSwitchDocked=ignore
DELIM
```

## Links

* [Power management: archlinux.org](https://wiki.archlinux.org/title/Power_management) - 20251203
* http://www.freedesktop.org/software/systemd/man/logind.conf.html
* http://www.freedesktop.org/software/systemd/man/loginctl.html
