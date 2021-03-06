# general

timers are a way to create a cronjob via systemd.

# example

## create a cron job that is executed each five minutes

### first, we need to create the service file

```
sudo su
cd /etc/systemd/system
vim <your-name>.service

[Unit]
Description=<add some description>
After=network.target

[Service]
Type=simple
ExecStart=<path to your script>
User=<user name>
Group=<group name>
```

### now, we need to create the timer file

```
sudo su
cd /etc/systemd/system
vim <your-name>.timer

[Unit]
Description=<add some description>

[Timer]
#OnBootSec=5min
#OnUnitActiveSec=5min
#OnCalendar=weekly

[Install]
WantedBy=multi-user.target
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

* [Systemd Timer Units für zeitgesteuerte Aufgaben verwenden - pro-linux.de](https://www.pro-linux.de/artikel/2/1992/systemd-timer-units-f%C3%BCr-zeitgesteuerte-aufgaben-verwenden.html) - 2020-02-28
* http://jason.the-graham.com/2013/03/06/how-to-use-systemd-timers/
* https://wiki.archlinux.org/index.php/Systemd/Timers
* http://www.freedesktop.org/software/systemd/man/systemd.timer.html
* http://northernlightlabs.se/drupal.cronjob.with.systemd
