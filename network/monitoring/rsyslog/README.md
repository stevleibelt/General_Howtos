# Rsyslog

## Automatically cleanup syslog table

Insert content from below in a cronjob file, adapt the dynamic part and run it once per day.

```
#/bin/bash
####
# Deletes entries older than x days
# Optimize table afterwards.
####
# @since 2021-04-21
# @author stev leibelt <artodeto@bazzline.net>
####

####
####
# @param: string <database user name>
# @param: string <database user password>
# [@param: int <days to keep in the past>] #default is keep the last 90 days
####
function cleanup_and_optimize_syslog_systemevents ()
{
    local DATABASE_NAME="Syslog"
    local DATABASE_PASSWORD="${2:-tb1111}"
    local DATABASE_TABLE="SystemEvents"
    local DATABASE_USER="${1:-syslog}"
    local DAYS_TO_KEEP_IN_THE_PAST="${3:-90}"

    #bo: cleanup
    mysql -u ${DATABASE_USER} -p${DATABASE_PASSWORD} -e "DELETE FROM `${DATABASE_TABLE}` WHERE `${DATABASE_TABLE}`.`DeviceReportedTime` < date_add(current_date, interval - ${DAYS_TO_KEEP_IN_THE_PAST} day)" ${DATABASE_NAME}
    #eo: cleanup

    #bo: maintenance
    #   check table health
    mysqlcheck -u ${DATABASE_USER} -p${DATABASE_PASSWORD} --check --databases ${DATABASE_NAME}
    #   reclaim unused disk space
    mysqlcheck -u ${DATABASE_USER} -p${DATABASE_PASSWORD} --optimize --databases ${DATABASE_NAME}
    #   rebuild and optimize indexes
    mysqlcheck -u ${DATABASE_USER} -p${DATABASE_PASSWORD} --analyze --databases ${DATABASE_NAME}
    #eo: maintenance
}

cleanup_and_optimize_syslog_systemevents "PUT_IN_YOUR_DATABASE_USER_NAME" "PUT_IN_YOUR_DATABASE_USER_PASSWORD" 120
```

# Links

* [rsyslog documentation - official V8](https://www.rsyslog.com/doc/v8-stable/) - 20210419
