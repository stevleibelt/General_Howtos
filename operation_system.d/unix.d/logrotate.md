# Logrotate

## Example

```bash
cat > /etc/logrotate.d/my_example<<DELIM
#yes, comments are allowed
#general option, used for all entries inside
#compress rotated files
compress
#truncates the original file to zero - good if there is an open filehandler *but* you might loose some messages
copytruncate
#creates the log file with this settings
create 0644 www-data www-data
#rotate on a daily basis
daily
#add suffix like 20181108
dateformate -%Y%m%d
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
#change user and group
su www-data www-data

/path/to/my/log/*.log {
#all general options are used in here
}
DELIM
```

## How to test/debug

```
logrotate /etc/logrotate.d/my_example -d
#with verbosity
logrotate /etc/logrotate.d/my_example -dv
#
```

## Links

* [How To Setup Logrotate To Manage Log Files In Linux](https://www.looklinux.com/how-to-setup-logrotate-to-manage-log-files-in-linux/) - 20180822
* [How To Manage Log Files With Logrotate On Ubuntu 12.10](https://www.digitalocean.com/community/tutorials/how-to-manage-log-files-with-logrotate-on-ubuntu-12-10) - 20130418
* [How To Manage Logfiles with Logrotate on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-manage-logfiles-with-logrotate-on-ubuntu-16-04) - 20171110
* [magic of "logrotate -d"](https://ihazem.wordpress.com/2013/04/09/logrotate-olddir-directive-and-executing-logrotate-for-first-time/) - 20130409
* [Rotate and archive logs with the Linux logrotate command](https://opensource.com/article/21/10/linux-logrotate) - 20211007
