# example cronjob service

```
#the cronjob file
cat > /etc/systemd/system/my-php-example.service <<DELIM
[Unit]
Description=Example PHP Service

[Service]
Type=oneshot
User=www-data
ExecStart=/usr/bin/env php /var/www/example/my_cron.php

[Install]
WantedBy=basic.target
DELIM
```

```
cat > /etc/systemd/system/my-php-example.timer <<DELIM
#the cron definition
[Unit]
Description=Run Example PHP Service daily at 04:00

[Timer]
OnCalendar=*-*-* 4:00:00
Persistent=true

[Install]
WantedBy=timers.target
DELIM
```

```
systemd reload systemctl daemon-reload
activate the timer systemctl enable my-php-example.timer
start the timer systemctl start my-php-example.timer
```

# link

* [Setup Cron or systemd timers for the Nextcloud Preview Generator - 2018-09-20](https://nextcloud.com/blog/setup-cron-or-systemd-timers-for-the-nextcloud-preview-generator/)
