# SQLite

## Configure client

```bash
vi ~/.sqliterc
```

## Create database

```bash
sqlite3 <string: database_name>.db
```

## Import csv file

Following command will create a database table if needed

```bash
sqlite3
#switch to csv mode
.mode csv
#configure the separator
.separator ","
#import csv file
.import <file_path>.csv <database_name>
```

## Export and import data from sqlstatement

```bash
# source database
sqlite3 <string: database_name>.db
#  to sql
.output my_export.sql
SELECT * FROM foo;
.exit
#  to csv
.mode csv
.output my_export.csv
SELECT * FROM foo;
.exit

# destination database
#  from sql
.import my_export.sql <string: target_table_name>
#  from csv
.mode csv
.import my_export.csv <string: target_table_name>
```

A full dump can be done by using `.dump` instead of the select statement.

All can be done from the command line without "logging into the database".

```bash
sqlite3 <string: database_name>.db <<EOF
SELECT * FROM foo;
.exit
EOF
```

## List available tables and columns

```bash
sqlite3

# list tables
.tables

# list columns
PRAGMA table_info(table_name);

# list create schema
.schema
```

## Check data

```bash
# ref: https://www.sqlite.org/pragma.html#pragma_integrity_check
sqlite3 <string: database_name>
pragma integrity_check;
```

## Links

* [quick tutorial by mark litwintschik](http://tech.marksblogg.com/sqlite3-tutorial-and-guide.html)
