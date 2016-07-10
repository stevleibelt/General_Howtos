# memory

## benefits

* b-tree index
* backup support
* replication support
* query cache support
* hash index
* encrypted data
* update statistics for data dictionary
* support for auto increment
* up to 64 indexes per table
* up to 16 columns per index and a maximum key length of 3072 bytes

## drawback

* no full text search
* no index cache
* no transactions
* no compressed data
* each data manipulation results in a full table lock
* no foreign key support
* varchar are stored as fixed text length
* no blob or text allowed
* you have to create the memory table each time the server starts
* you have to do a truncate/delete to the new created memory table to clean up possible invalid states on the salves
* it is a hazzle to join a memory table (the kind of index is importat for the query optimizer)

## hints and good to knows

* memory is not freed on a delete statement, it is preserved for an upcomming insert
* use "ALTER TABLE \<table name\> ENGINE=MEMORY" to force a table rebuild (free up memory) (or do a DROP TABLE or TRUNCATE TABLE)
* if you really need the memory table on the salves, do the following trick on a restart
    * on the master, execute DELETE IF TABLE EXISTS followed by CREATE TABLE (and of course stop all processes using this table upfront)

## calculate usage of one row in a memory table

```
SUM_OVER_ALL_BTREE_KEYS(max_length_of_key + sizeof(char*) * 4)
+ SUM_OVER_ALL_HASH_KEYS(sizeof(char*) * 2)
+ ALIGN(length_of_row+1, sizeof(char*))
```

## links

* http://dev.mysql.com/doc/refman/5.7/en/memory-storage-engine.html
* https://www.percona.com/blog/2010/10/15/replication-of-memory-heap-tables/
* http://dev.mysql.com/doc/refman/5.7/en/server-system-variables.html#sysvar_max_heap_table_size
* http://dba.stackexchange.com/questions/10806/mysql-memory-table-getting-many-locks/10821#10821
* http://dba.stackexchange.com/questions/11099/is-innodb-engine-up-to-speed-against-memory-engine

# links

* http://www.linux.org/threads/an-introduction-to-mysql-storage-engines.4220/
