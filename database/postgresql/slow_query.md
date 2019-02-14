# how to investigate slow queries

```sql
-- use explain
-- does not execute the statement but shows the planners execution plan
--  most critical is the total cost to return
EXPLAIN <statement>;

-- execute the statement to get the runtime
--  this is good to check if the planners guess is close to reality
EXPLAIN ANALYZE <statement>;

--  if you want to run an INSERT|DELETE|UPDATE|CREATE TABLE etc. statement without touching your data
BEGIN;
EXPLAIN ANALYZE <statement>;
ROLLBACK;

--  add more output
EXPLAIN ANALYZE VERBOSE BUFFERS TIMING <statement>;
```

# how to read EXPLAIN [ANALYZE] output

## scan methods

|| method name || short name || description ||
| Sequential Scan | Sec Scan | Full table scan, data fetched from table. |
| Index Scan | Index Scan | Suitable index found, data fetched from table. |
| Index Only | Index Only | Suitable index found, data fetched from index. |
| Bitmap Index Scan | Bitmap Heap Scan | Optimized Index Scan where rows are first cached |

## join methods

|| name || description ||
| Nested Loop Sec Scan | Does a full table scan for every row |
| Nested Loop Index Scan | Uses index for every row |
| Hash Join | A hash is created for the smaller table and is used when scanning the bigger table |
| Merge Join | Both tables are sorted by an value and that scanned in parallel |

# create an index

```sql
-- create an index without looking the table
--  takes way more time
CREATE INDEX CONCURRENTLY ...;

-- create an index with looking the table
CREATE INDEX ...;
```

# link

* [PostgreSQL Documentation - EXPLAIN](https://www.postgresql.org/docs/current/sql-explain.html) - 2019-02-14
* [PostgreSQL Documentation - Indexes](https://www.postgresql.org/docs/current/indexes.html) - 2019-02-14
    * [PostgreSQL Documentation - Examining Index Usage](https://www.postgresql.org/docs/current/indexes-examine.html) - 2019-02-14
    * [PostgreSQL Documentation - Indexes and ORDER BY](https://www.postgresql.org/docs/current/indexes-ordering.html) - 2019-02-14
* [PostgreSQL Documentation - REINDEX](https://www.postgresql.org/docs/current/sql-reindex.html) - 2019-02-14
* [Efficient Use of PostgreSQL Indexes](Efficient Use of PostgreSQL Indexes) - 2019-02-08
* [pgtune](https://pgtune.leopard.in.ua/) - 2019-02-14
