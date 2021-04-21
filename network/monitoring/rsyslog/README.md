# Rsyslog

## Sections

* [setup](setup.md) - Contains example configurations

## Test

```
#following message should occure in
#   journal -xfn
#   in your database
logger -p local0.warn mytestmessage
```

## Automatically cleanup syslog table

Use the [rsyslog mysql housekeeping](https://github.com/bazzline/rsyslog_mysql_housekeeping) script.

# Links

* [rsyslog documentation - official V8](https://www.rsyslog.com/doc/v8-stable/) - 20210419
    * [ommysql: MySQL Database Output Module](https://www.rsyslog.com/doc/v8-stable/configuration/modules/ommysql.html) - 20210420
    * [Understanding Rsyslog Queues](https://www.rsyslog.com/doc/v8-stable/concepts/queues.html) - 20210420
    * [General Queue Parameters](https://www.rsyslog.com/doc/v8-stable/rainerscript/queue_parameters.html) - 20210420
