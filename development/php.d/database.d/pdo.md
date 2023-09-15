# Pitfalls

## Buffered Mode

### Issue

PDO is working in [buffered mode](https://secure.php.net/manual/en/mysqlinfo.concepts.buffering.php) which results in the fact that the memory of the resource (sql statement result) is allocated in the script.
If you change to unbuffered mode, you can not use this connection for something else since you create a persistent connection until you get all the data.

### Possible Solution

If you have to deal with the issue of running out of memory when working with PDO, you have to create two connections.
One in unbuffered mode that does the "SELECT * FROM" and one in buffered mode to fetch additional data while iterating over the big collection.
