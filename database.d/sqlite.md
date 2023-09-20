# configure client

```
vi ~/.sqliterc
```

# create database

```
sqlite3 <database_name>.db
```

# import csv file

Following command will create a database table if needed

```
sqlite3
#switch to csv mode
.mode csv
#configure the separator
.separator ","
#import csv file
.import <file_path>.csv <database_name>
```

# list available tables

```
sqlite3
.schema <database_name>
```

# links

* [quick tutorial by mark litwintschik](http://tech.marksblogg.com/sqlite3-tutorial-and-guide.html)
