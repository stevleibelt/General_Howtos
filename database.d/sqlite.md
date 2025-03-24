# SQLite

## Configure client

```bash
vi ~/.sqliterc
```

## Create database

```bash
sqlite3 <database_name>.db
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

## Links

* [quick tutorial by mark litwintschik](http://tech.marksblogg.com/sqlite3-tutorial-and-guide.html)
