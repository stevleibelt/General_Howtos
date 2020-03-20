# How To

Given is the path `/foo/bar`.
We want to get a notification if something inside this path is changed.

## Create notification bash script

Path:
`/usr/local/bin/path_changed_email_alert.sh`

```
#!/bin/bash
mail -S sendwait -S "Path ${1} was changed on $hostname" foo@bar.ru
```

## Create service

Path:
`/etc/systemd/system/foo_bar_changed_monitor.service`

```
[Unit]
Description="Starts a script to trigger email alert"

[Service]
ExecStart=/usr/bin/local/bin/path_changed_email_alert.sh "/foo/bar"
```

## Create path unit

Path:
`/etc/systemd/system/foo_bar_changed_monitor.path`

```
[Unit]
Description="Monitors path /foo/bar""

[Path]
PathModified=/foo/bar
Unit=foo_bar_changed_monitor.service

[Install]
WantedBy=multi-user.target
```

## Verify the unit files

```
sudo systemd-analyze verify /etc/systemd/system/foo_bar_changed_monitor.*
```

## Start and enable units

```
sudo systemd start /etc/systemd/system/foo_bar_changed_monitor.path
sudo systemd enable /etc/systemd/system/foo_bar_changed_monitor.path
```

# Link

* [Use Systemd Path Units monitor directory path changes.](https://www.pro-linux.de/artikel/2/1994/systemd-path-units-zum-%C3%9Cberwachen-von-dateien-und-verzeichnissen-verwenden.html) - 2020-03-20
