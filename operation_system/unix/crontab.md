# list crontab

    crontab -l

# edit crontab

    crontab -e

# format

    <minute> <hour> <day_of_month> <month> <day_of_week> <command>

## schedule for specific time

    30 08 06 10 * /home/user/full-backup.sh #execute full-backup.sh on 6th of october at 08:30

## schedule for more than one instance

    00 11, 16 * * * /home/user/incremental-backup   #execute at 11:00 and 16:00 on each day

## schedule for specific range of time

    00 09-18 * * 1-5 /home/user/check-database-status #execute once per hour from 9 to 18 only at workingdays (1 to 5)

## schedule a job for every minute

    * * * * * echo "ping"   #runs every minute

## schedule for every 10 minutes

    */10 * * * * echo /home/usr/check-internet-connection

## specials

* @yearly - 0 0 1 1 *
* @daily - 0 0 * * * 
* @hourly - 0 * * * *
* @reboot - at startup

# links

* http://alvinalexander.com/linux/unix-linux-crontab-every-minute-hour-day-syntax
* http://www.thegeekstuff.com/2009/06/15-practical-crontab-examples/
