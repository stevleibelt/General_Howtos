# example

```
(
    SELECT column_one AS id, column_two AS name
    FROM table_one
)
UNION
(
    SELECT columnOne AS id, columnTwo as name
    FROM table_two
)
```

# to know

* if you don't use alias, the result column names are set by the first select statement
* ORDER BY after the last select statement
    * ORDER BY 2, 1 -- order by second column first - this short notation is also possible

# links

* https://dev.mysql.com/doc/refman/5.7/en/union.html
* http://www.mysqltutorial.org/sql-union-mysql.aspx
* http://www.wellho.net/solutions/mysql-mysql-select-join-versus-union-where-versus-having-group-etc.html
