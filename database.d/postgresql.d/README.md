# PostgreSQL

[PostgreSQL](https://www.postgresql.org/) claims to be the most advanced open soure relational database.

## Check connection

```bash
# is it the right port?
telnet <string: hostname_or_ip_address> <int: port>

# use psql
psql -U <string: username> -p <int: port> -h <string: hostname_or_ip_address> -d <string: database_name>
```

## List of commands

| Command | Description |
| --- | --- |
| `\q` | Quit connection |
| `DROP ROLE <role_name>;` | Drops a role |
| `\c <database_name>` | Connect to database name |
| `\l` | List tables |
| `\dt` | List database tables database |
| `\du` | List database users |

## Example vacuum settings

```bash
#enable feature
autovacuum = on
#minimum number of dead rows to trigger this feature
autovacuum_vacuum_threshold = 100
#minimum number of live rows/available entries that must exist
autovacuum_analyze_threshold = 100
#how many dead rows, based on the table size, are needed to trigger this feature
autovacuum_vacuum_scale_factor = 0.5
#minimum number of live rows that are needed to trigger this feature
autovacuum_analyze_scale_factor = 0.2
#number of milliseconds to wait before starting this feature
autovacuum_vacuum_cost_delay = 50
#number of dead rows that can be vacuumed per feature run
autovacuum_vacuum_cost_limit = 500
```

## Links

* [Official site](https://www.postgresql.org/)
* [PostgreSQL Vacuuming to Optimize Database Performance and Reclaim Space](https://www.percona.com/blog/postgresql-vacuuming-to-optimize-database-performance-and-reclaim-space/)

