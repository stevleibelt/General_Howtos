# general

timers are a way to create a cronjob via systemd.

# example

## create a cron job that is executed each five minutes

### first, we need to create the service file

```
sudo su
cd /etc/systemd/system
echo "[Unit]
Description=<add some description>
After=network.target

[Service]
Type=simple
ExecStart=<path to your script>
User=<user name>
Group=<group name>
" > <your-name>.service
```

### now, we need to create the timer file

```
sudo su
cd /etc/systemd/system
echo "[Unit]
Description=<add some description>

[Timer]
OnBootSec=5min
OnUnitActiveSec=5min

[Install]
WantedBy=multi-user.target
" > <your-name>.timer
```

### for testing

```
systemctl start <your name>.service
```

### enable it

```
systemctl start <your name>.timer
systemctl enable <your name>.timer
```

### disable it

```
systemctl disable <your name>.timer
systemctl stop <your name>.timer
```

# links

* https://wiki.archlinux.org/index.php/Systemd/Timers
* http://www.freedesktop.org/software/systemd/man/systemd.timer.html
* http://northernlightlabs.se/drupal.cronjob.with.systemd
