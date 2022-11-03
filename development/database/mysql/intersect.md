# Intersect

If you use intersect, you get all the entries that match the first and the second query as result.

```sql
SELECT
  first_column, second_column
FROM
  first_table
-- optional more conditions
INTERSECT
SELECT
  first_column, second_column
FROM
  second_table
-- optional more conditions
```

## Links

* [Set theorie in mysql 8.0 union and now intersect and except](https://www.percona.com/blog/set-theory-in-mysql-8-0-union-and-now-intersect-and-except/) - 20221103

