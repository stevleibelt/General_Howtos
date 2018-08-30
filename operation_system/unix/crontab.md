# list crontab

```
crontab -l
```

# edit crontab

```
crontab -e
```

# format

```
<minute> <hour> <day_of_month> <month> <day_of_week> <command>
```

## schedule for specific time

```
30 08 06 10 * /home/user/full-backup.sh #execute full-backup.sh on 6th of october at 08:30
```

## schedule for more than one instance

```
00 11, 16 * * * /home/user/incremental-backup   #execute at 11:00 and 16:00 on each day
```

## schedule for specific range of time

```
00 09-18 * * 1-5 /home/user/check-database-status #execute once per hour from 9 to 18 only at workingdays (1 to 5)
```

## schedule a job for every minute

```
* * * * * echo "ping"   #runs every minute
```

## schedule for every 10 minutes

```
*/10 * * * * echo /home/usr/check-internet-connection
```

## specials

* @yearly - 0 0 1 1 *
* @daily - 0 0 * * * 
* @hourly - 0 * * * *
* @reboot - at startup

# good default to start in your crontab

```
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
```

# example

## crontab entry

```
#<minute>   <hour>  <day_of_month>  <month>     <day_of_week>   <command>
08           15      *               *           *               /home/<user>/<path/to/my_script.sh>
```

## my_script.sh

```
#!/bin/bash -l

/home/<user>/<path/to/command> [<argument one>[<argument ...>]] 1>//home/<user>/data/log/crontab/<command>.log 2>/home/<user>/data/log/crontab/<command>-error.log
```

## simple php check

```
*/1 * * * * /usr/local/bin/php -r 'echo "ping" . PHP_EOL;' >> /var/log/cronjob.log 2>&1
```

# debug

## dump environemt

``
* * * * * env > env_dump.txt
``

compare with your local/session environment.

# links

* http://alvinalexander.com/linux/unix-linux-crontab-every-minute-hour-day-syntax
* http://www.thegeekstuff.com/2009/06/15-practical-crontab-examples/
* https://stackoverflow.com/questions/2388087/how-to-get-cron-to-call-in-the-correct-paths
* http://unixhelp.ed.ac.uk/CGI/man-cgi?crontab+5
* https://en.wikipedia.org/wiki/Env
* https://opensource.com/article/17/11/how-use-cron-linux
