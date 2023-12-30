# Example configuration

## Handle high load spikes or offline database / write lock to `Syslog`.`SystemEvents`

Important changes to `/etc/rsyslog.conf`.

```
module(load="imuxsock") # provides support for local system logging

# provides UDP syslog reception
module(load="imudp")
input(type="imudp" port="514")

# Make sure this path exists and the user of the deamon has read/write/execute access
$WorkDirectory /var/spool/rsyslog # default location for work (spool) files
# Check if this line exists
$IncludeConfig /etc/rsyslog.d/*.conf
```

Important changes to `/etc/rsyslog.d/mysql.conf`.

```
### Configuration file for rsyslog-mysql
### Changes are preserved
# Load output module mysql
module (load="ommysql")
# Create action
#       *.*:            for all messages
#       type... :       insert into mysql to server.database_name with auth user and password
#       queue.  :       use the queue "databasequeue" as linked list as buffer
*.* action(type="ommysql" server="<hostname>" db="Syslog" uid="<database user name>" pwd="<database user password>"
    queue.filename="databasequeue" queue.type="LinkedList" action.resumeRetryCount="-1"
)
####
# for PostgreSQL replace :ommysql: by :ompgsql: below: *.* :ommysql:hostname,dbname,userid,password;
```
