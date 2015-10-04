# General

* lowest priority "-20"
* highest priority "19"
* default lower priority "-10"
* default higher priority "9"

# Start Process With Different Priority

```
/bin/nice -n <integer> <command>
```

# Change Process Of Running Processes

```
renice <priority> -p <process id>
# increase by one
renice +1 -p <process id>
# renice all by user
renice -1 -u <user name>
```

# Links

* https://en.wikipedia.org/wiki/Nice_(Unix)
* http://www.cyberciti.biz/faq/change-the-nice-value-of-a-process/
* http://www.cyberciti.biz/faq/howto-change-unix-linux-process-priority/
* http://www.computerhope.com/unix/renice.htm
* http://linux.101hacks.com/monitoring-performance/hack-101-renice-command-examples/
