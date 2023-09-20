# UUID or integer

Benefits of uuid:
* unique across table, database and servers
* fixed size
* "SELECT UUID();" build in modern database management systems

Benefits for integer:
* smaller storage needed
* autoincrement build in all database management systems
* "order by" is fast

# Thoughts about the beneftis

Indeed, the storage for intenger is smaller. This is a thing that will change in growing up servers over the time since disk space and memory is going to grow and grow.
The "order by" is something you really have to think about how often you need this. I've figured out that I am ordering way more often by "created_at" or other dates.
The benefit of having one unique id across tables, databases and even systems is a strong benefit.
Even when creating files on the harddisk, I like the "you don't have to keep an index globally available" since you just create a unique id.

# link

* [Storing UUID and generated columns - 2017-05-03.](https://www.percona.com/blog/2017/05/03/uuid-generated-columns/)
* [Store UUID in an optimized way - 2014-12-19.](https://www.percona.com/blog/2014/12/19/store-uuid-optimized-way/)
* [MySQL 5.0.45 - UUID vs interger insert performance.](http://kccoder.com/mysql/uuid-vs-int-insert-performance/)
