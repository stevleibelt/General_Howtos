# VNC

## Setup vnc on user session startup

We want to reach the goal that a vnc server is running each time a special user is starting its session.

* Install tigervnc
* open command line as this user
    * vncpasswd
    * `cd ~/.config/systemd/user
```
cat > x0vncserver.service <<DELIM
[Unit]
Description=Remote desktop service (VNC)

[Service]
Type=simple
# wait for Xorg started by ${USER}
ExecStartPre=/bin/sh -c 'while ! pgrep -U "$USER" Xorg; do sleep 2; done'
ExecStart=/usr/bin/x0vncserver -rfbauth %h/.vnc/passwd
# or login with your username & password
#ExecStart=/usr/bin/x0vncserver -PAMService=login -PlainUsers=${USER} -SecurityTypes=TLSPlain

[Install]
WantedBy=default.target
DELIM
```
    * `systemctl --user enable x0vncserver.service
    * `systemctl --user start x0vncserver.service

# Link

* [TigerVNC on archlinux.org](https://wiki.archlinux.org/title/TigerVNC) - 20220305
