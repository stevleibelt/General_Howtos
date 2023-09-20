# Lightpack

## Prismatik

[Prismatik](https://github.com/psieg/Lightpack) is the software you want to use to drive the great [lightpack](https://lightpack.tv/).

### Setup autostart

```
#as user who is launching prismatik
#@see: https://wiki.archlinux.org/title/Systemd/User

mkdir -p ~/.config/systemd/user
cat > ~/.config/systemd/user/prismatik.service <<DELIM
[Unit]
Description=Autostart prismatik on user login

[Service]
ExecStart=/usr/bin/prismatik

[Install]
WantedBy=default.target
DELIM

systemctl --user enable prismatik.service
```
