# collection of performance monitoring tools

* genera files to look
    * /proc/meminfo
    * /proc/stat
    * /proc/`*`/stat

# vmstat

```
vmstat reports information about processes, memory, paging, block IO, traps, disks and cpu activity.
```

## description

* procs: r          -   number of processes waiting for run time
* procs: b          -   number of processes in uninterruptible sleep
* memory: swpd      -   amount of virtual memory
* memory: free      -   amount of idle memory
* memory: buff      -   amount of memory used
* memory: cache     -   amount of memory used as cache
* memory: inact     -   amount of inactive memory
* memory: active    -   amount of active memory
* swap: si          -   amount of swapped in from the disk
* swap: so          -   amount of swapped to the disk
* io: bi            -   blockes received from a block device
* io: bo            -   blockes sent to a block device
* system: in        -   amount of interrupts
* system: cs        -   amount of context switches
* cpu: us           -   amount of time running user code
* cpu: sy           -   amount of time running kernel code
* cpu: id           -   aount of time in idle
* cpu: wa           -   aount of time in waiting
* cpu: st           -   aount of time solten from virtual machine

## options

* -d    -   disk statistic
* -h    -   help

# iostat

## examples

    # execute every 2 seconds for 3 times
    iostat 2 3

## options

* -c    -   cpu statistics
* -d    -   disk i/o statistics
* -n    -   network statistics
* -m    -   display i/o in MB/seconds
* -p    -   display for only one device
* -t    -   display timestamp information
* -x    -   display extended status
* -N    -   display lvm statistics

# mpstat

## options

* -A    -   display all informations
* -P    -   display per cpu core (0, 1, ALL)

# nmon

* nmon tool is designed for AIX and Linux performance specialists to use for monitoring and analyzing performance data

## write data to a csv file

```
# run nmon for 120 cycles while one cycle takes 30 seconds (60 minutes in total)
# captures a snapshot each 30 seconds to file <hostname>_date_time.nmon
nmon -f -s 30 -c 120
# same as above but also capture the top processes
nmon -fT -s 30 -c 120
```

# netstat

* use ss (part of iproute2) or “lsof -i” instead

# isag

* interactive system activity grapher (for sysstat)
* displays graphically the system activity data produced by sar from sysstat

# pidstat

* see statistic for particular process (and all of its child processes)
* syntax: pidstat <options> <interval> <count>

## examples

```
# see i/o statistics for process 123
pidstat -d -p 123
```

# sadf

* display data produced by sar in multiple formats

# sar

## examples

```
# display information about all cpu cores
sar -P ALL

# memory (updated every second for three times)
sar -r 1 3

# used swapt space
sar -S 1 3

# general i/o
sar -b 1 3

# device i/o
sar -d 1 3

# context switches
sar -w 1 3
```

# links

* http://www.computerhope.com/unix/vmstat.htm
* https://en.wikipedia.org/wiki/Vmstat
* https://en.wikipedia.org/wiki/Nmon
* http://www.ibm.com/developerworks/aix/library/au-analyze_aix/
* https://en.wikipedia.org/wiki/Iostat
* http://www.thegeekstuff.com/2011/07/iostat-vmstat-mpstat-examples/
* https://en.wikipedia.org/wiki/Mpstat
* https://en.wikipedia.org/wiki/Netstat
* http://www.cyberciti.biz/open-source/command-line-hacks/linux-monitor-process-using-pidstat/
* http://linux.die.net/man/1/sadf
* http://www.thegeekstuff.com/2011/03/sar-examples/
* http://linux.die.net/man/1/sar
* http://sebastien.godard.pagesperso-orange.fr/
* https://wiki.archlinux.org/index.php/Category:Status_monitoring_and_notification
