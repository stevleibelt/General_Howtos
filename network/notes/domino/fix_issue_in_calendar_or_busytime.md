# Fix an issue in the calendar or busytime.nsf

Following fixes are tested only on a IBM Domino 10.x.

## Try to let domino do the work

```
#tell rnrmgr check
#tell rnrmgr validate <name of the ressource>
tell shed validate <name of the ressource>
```

## Get your hands dirty - the hard way

It can happen that you use the resource planing tool in domino and that your busytime.nsf ends up with a "hidden" entry for a resource.
"Hidden" entry means an event that blocks a resource on a regular basis but is not shown when you view the timetable of this resources.
You figure this entry only by narrow the time down this entry is blocking the ressource.
The following list of commands tries to fix this. You have to put them one by one into your domino console.

```
#stops the schedule manager task on this server
#@see: https://help.hcltechsw.com/domino/10.0.1/admn_schedulemanagertellcommands_r.html
tell sched quit

#stops the calendar connector task on this server
tell calconn quit

#stops the rooms and resource manager task on this server
tell rnrmgr quit
```
Go to the place where the `busytime.nsf` is located and mark it. You have to be ready to rename is quickly.

```
#write all cashed entries to all open nsf files and close the file handler
dbcache flush
```

Now rename your existing `busytime.nsf` to something else like `busytime.nsf.<yymmdd_hhiiss>` (or input `rm busytime.nsf` in the console).

```
#starts schedule manager task on this server
load sched

#starts calendar connector task on this server
load calconn

#starts the rooms and resource manager task on this server
load rnrmgr

#starts the rebuild of the `busytime.nsf` by validating all user calendar
tell sched validate
```

# Link

* [Calendars and scheduling - help.hcltechsw.com](https://help.hcltechsw.com/domino/10.0.1/conf_calendarsandscheduling_r.html?hl=calconn)
