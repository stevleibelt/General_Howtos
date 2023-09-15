# PostgreSQL

## Daily Usage

```sql
#bo: general remarks
####
#+  - show additional details
#S  - show system objects
####
#eo: general remarks

#stop or kill a query
##find fitting process
SELECT * FROM pg_stat_activity WHERE state = 'active';

##kill pid
SELECT pg_cancel_backend(<int: pid_of_the_process>)

#create a dump / export
pg_dump <database_name> > <database_name>_<yyyymmddTHHMMss>.sql

#import dump
psql -d <database_name> -f <database_name>_<yyyymmddTHHMMss>.sql

#create database
sudo su - postgres
psql
CREATE DATABASE <database_name>
\q

#switch connectio to a new database
\c <database_name>

#list available database
\l[+] [<string: pattern>]

#list available tables
\dt[S+] [<string: pattern>]

#describe table
#S+                         - list tables, views and sequences
#S+ <string: table_name>    - list tables, views, sequences or indexes
\d[S+] <string: table_name>

#list available functions (only agg, normal, trigger or windows) of current database
\df[S+] [<string: pattern>]

#list rolls
\dg[S+] [<string: pattern>]

#list available indexes of current database
\di[S+] [<string: pattern>]

#list all schemes of current database
\dn[S+] [<string: name>]

#list privilegtes for tables, vewis and sequences
\dp [<string: pattern>]

#list available sequences of current database
\ds[S+] [<string: pattern>]

#list available views of current database
\dv[S+] [<string: pattern>]

#list all users and their assigned roles
\du

#show last error message with all details
\errverbose

#list current postgresql server version
SELECT version();

#execute the last command again
\g

#import and execute sql commands from file
\i <string: file_name>

#output results in the file
\o <string: file_name>

#display command history
\s

#save command history to a file
\s <string: file_name>

#show function definition
\sf[+] <string: function_name>

#show view definition
\sv[+] <string: function_name>

#list all available commands
\?

#get help
#e.g.: \h ALTER TABLE
\h [<string: comman_or_section>]

#edit commandn in your editor
\e

#switch from aligned to non-aligned column output
\a

#switch to html output
\H

#exist postgresql shell
\q
```

## Datatype

### Serial

* `SERIAL` is a shorthand for `BIGINT NOT NULL AUTO_INCREMENT UNIQUE`

## Link

* [Getting started postgresql](https://opensource.com/article/19/11/getting-started-postgresql) - 20191112
* [Don't use chat](https://wiki.postgresql.org/wiki/Don't_Do_This#Don.27t_use_char.28n.29) - 20220926
* [Drop your database for PostgreSQ](https://opensource.com/article/22/9/drop-your-database-for-postgresql) - 20220925
* [PostgreSQL Sequences – Episode 5 of PostgreSQL for MySQL DBAs](https://www.percona.com/blog/postgresql-sequences-episode-5-of-postgresql-for-mysql-dbas/) - 20220706T14:51:20

