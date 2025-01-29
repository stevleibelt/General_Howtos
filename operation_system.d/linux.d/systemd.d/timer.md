# Timer files for systemd

Timers are a way to create a cronjob via systemd.

## List and inspect

```bash
# list all timers
systemctl list-timers --all

# inspect one timer
systemctl show my_foo.timer

# show dedicated properties for all timers
systemctl show --property=Description,NextElapseUSec,Unit,TimersCalendar,OnCalendar *.timer
```

## Example

### Create a cron job that is executed each five minutes

#### First, we need to create the service file

```bash
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

#### Now, we need to create the timer file

```bash
sudo su
cd /etc/systemd/system
vim <your-name>.timer

[Unit]
Description=<add some description>

[Timer]
##Start exactly or randomized up to five seconds later
#AccuracySec=5s
##Wait five minutes before starting the service after each boot
#OnBootSec=5min
##Wait 30 seconds before starting the service
#OnActiveSec=30s
#OnUnitActiveSec=5min
#OnCalendar=weekly
##Start the service file every 30 seconds, at x:x:05 and x:x:35
#OnCalendar=*:*:05,35

[Install]
WantedBy=multi-user.target
```

#### For testing

```bash
systemctl start <your name>.service
```

#### Enable it

```bash
systemctl start <your name>.timer
systemctl enable <your name>.timer
```

#### Disable it

```bash
systemctl disable <your name>.timer
systemctl stop <your name>.timer
```

## Links

* [Systemd Timer Units für zeitgesteuerte Aufgaben verwenden - pro-linux.de](https://www.pro-linux.de/artikel/2/1992/systemd-timer-units-f%C3%BCr-zeitgesteuerte-aufgaben-verwenden.html) - 20200228
* [Using systemd timers to run things frequently (some early notes)](https://utcc.utoronto.ca/~cks/space/blog/linux/SystemdFastTimersEarlyNotes) - 20220827
* http://jason.the-graham.com/2013/03/06/how-to-use-systemd-timers/
* https://wiki.archlinux.org/index.php/Systemd/Timers
* http://www.freedesktop.org/software/systemd/man/systemd.timer.html
* http://northernlightlabs.se/drupal.cronjob.with.systemd

