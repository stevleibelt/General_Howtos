# restore from a backup

* only the content is restored, not the index!

```
#assuming you have a backup in the path:
#   /opt/couchbase/var/lib/couchbase/backup
cbtransfer -v couchstore-files:///opt/couchbase/var/lib/couchbase/backup couchbase://127.0.0.1:8091 -u <username> -p <password> -b <my_bucket_name>
```

# link

* [cbtransfer](https://developer.couchbase.com/documentation/server/current/cli/cbtransfer-tool.html)
* [cbrestore](https://developer.couchbase.com/documentation/server/current/cli/cbrestore-tool.html#cdbrestore-tool)
* [backup and restore](https://developer.couchbase.com/documentation/server/current/backup-restore/backup-restore.html)
* [cbbackupmgr tool](https://developer.couchbase.com/documentation/server/current/backup-restore/enterprise-backup-restore.html)
* [enterprise backup strategies](https://developer.couchbase.com/documentation/server/current/backup-restore/cbbackupmgr-strategies.html)
* [enterprise backup tutorial](https://developer.couchbase.com/documentation/server/current/backup-restore/cbbackupmgr-tutorial.html)
