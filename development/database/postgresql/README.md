# PostgreSQL

## Daily Usage

```
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
\l

#list available tables
\dt

#describe table
\d <table_name>

#list all schemes of current database
\dn

#list available functions of current database
\df

#list available views of current database
\dv

#list all users and their assigned roles
\du

#list current postgresql server version
SELECT version();

#execute the last command again
\g

#display command history
\s

#save command history to a file
\s <file_name>

#execute sql commands from file
\i <file_name>

#list all available commands
\?

#get help
\h Get help
\h ALTER TABLE

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
* [PostgreSQL Sequences – Episode 5 of PostgreSQL for MySQL DBAs](https://www.percona.com/blog/postgresql-sequences-episode-5-of-postgresql-for-mysql-dbas/) - 20220706T14:51:20

