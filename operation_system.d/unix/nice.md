# General

* lowest priority "-20"
* highest priority "19"
* default lower priority "-10"
* default higher priority "9"

# Start Process With Different Priority

```
/bin/nice -n <integer> <command>
```

# Start A Process With Lowest Priority

```
/usr/bin/env nice -n 19 <process>
```

# Change Process Of Running Processes

```
renice <priority> -p <process id>
# set nice value to +1 for the fitting process
renice -10 -p <process id>
# set nice to value -10 for all processes running by the user
renice -10 -u <user name>
```

# Links

* https://en.wikipedia.org/wiki/Nice_(Unix)
* http://www.cyberciti.biz/faq/change-the-nice-value-of-a-process/
* http://www.cyberciti.biz/faq/howto-change-unix-linux-process-priority/
* http://www.computerhope.com/unix/renice.htm
* http://linux.101hacks.com/monitoring-performance/hack-101-renice-command-examples/
