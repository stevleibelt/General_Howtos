# example

```
cat > /etc/logrotate.d/my_example<<DELIM
#yes, comments are allowed
#general option, used for all entries inside
#compress rotated files
compress
#truncates the original file to zero - good if there is an open filehandler *but* you might loose some messages
copytruncate
#creates the log file with this settings
create 0644 root root
#rotate on a daily basis
daily
#good if there are open filehandlers, compression is done on the next rotation cycle
delaycompress
#no error if the logfile is missing
missingok
#do not handle empty files
notifempty
#rotate the file seven times before deleting it/keep seven older versions
rotate 7
#rotate if the file size has reached 100 megabyte
size 100M

/path/to/my/log/*.log {
#all general options are used in here
}
DELIM
```

# how to test/debug

```
logrotate /etc/logrotate.d/my_example -d
```

# link

* [How To Setup Logrotate To Manage Log Files In Linux - seen at 2018-08-22.](https://www.looklinux.com/how-to-setup-logrotate-to-manage-log-files-in-linux/)
* [How To Manage Log Files With Logrotate On Ubuntu 12.10 - 2013-04-18.](https://www.digitalocean.com/community/tutorials/how-to-manage-log-files-with-logrotate-on-ubuntu-12-10)
* [How To Manage Logfiles with Logrotate on Ubuntu 16.04 - 2017-11-09.](https://www.digitalocean.com/community/tutorials/how-to-manage-logfiles-with-logrotate-on-ubuntu-16-04)
* [magic of "logrotate -d" - 2013-04-09](https://ihazem.wordpress.com/2013/04/09/logrotate-olddir-directive-and-executing-logrotate-for-first-time/)
