# analyze table

```
mysqlcheck --analyze [--user=<user_name>] [--password=<password>] [--all-databases]
```

# repair table

```
mysqlcheck --repair [--user=<user_name>] [--password=<password>] [--all-databases]
```

# optimize table

```
mysqlcheck --optimize [--user=<user_name>] [--password=<password>] [--all-databases]
```

# more?

```
man mysqlcheck
```

# As SQL Statement

```
-- @see: http://dev.mysql.com/doc/refman/5.7/en/analyze-table.html
ANALYZE TABLE `my_table`;

-- @see: http://dev.mysql.com/doc/refman/5.7/en/check-table.html
CHECK TABLE `my_table`;

-- @see: http://dev.mysql.com/doc/refman/5.7/en/repair-table.html
REPAIR TABLE `my_table`;

-- @see: http://dev.mysql.com/doc/refman/5.7/en/optimize-table.html
OPTIMIZE TABLE `my_table`;
```
