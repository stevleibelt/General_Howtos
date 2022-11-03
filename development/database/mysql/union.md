# Uniion

```
(
    SELECT column_one AS id, column_two AS name
    FROM table_one
)
UNION
(
    SELECT column_one AS id, columnTwo AS name
    FROM table_two
)
```

## good to know

* UNION removes duplicate entries by default from the result set, if you don't want to have this, use `UNION ALL`
* if you don't use alias, the result column names are set by the first select statement
* ORDER BY after the last select statement
    * ORDER BY 2, 1 -- order by second column first - this short notation is also possible

## Links

* [Set theorie in mysql 8.0 union and now intersect and except](https://www.percona.com/blog/set-theory-in-mysql-8-0-union-and-now-intersect-and-except/) - 20221103
* https://dev.mysql.com/doc/refman/5.7/en/union.html
* http://www.mysqltutorial.org/sql-union-mysql.aspx
* http://www.wellho.net/solutions/mysql-mysql-select-join-versus-union-where-versus-having-group-etc.html
