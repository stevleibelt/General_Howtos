# how to prevent (mostly for innodb)

* always limit your data when you hit update something
* use "ORDER BY `id` DESC" to prevent locking too much unwanted rows (or gaps in the rows)

# link

* https://www.xaprb.com/blog/2006/08/03/a-little-known-way-to-cause-a-database-deadlock/
* https://www.xaprb.com/blog/2006/08/10/how-to-use-order-by-and-limit-on-multi-table-updates-in-mysql/
