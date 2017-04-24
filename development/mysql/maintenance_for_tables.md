# analyze table

```
mysqlcheck --analyze [--user=<user_name>] [--password=<password>] [--all-databases]
#or
mysql -u${MYSQL_USER_NAME} -p${MYSQL_PASSWORD} -h${MYSQL_HOST} ${MYSQL_DATABASE} --execute="ANALYZE TABLE ${TABLE_NAME_TO_TAKE_CARE_OF};"
```

# repair table

```
mysqlcheck --repair [--user=<user_name>] [--password=<password>] [--all-databases]
#or
mysql -u${MYSQL_USER_NAME} -p${MYSQL_PASSWORD} -h${MYSQL_HOST} ${MYSQL_DATABASE} --execute="REPAIR TABLE ${TABLE_NAME_TO_TAKE_CARE_OF};"
```

# optimize table

```
mysqlcheck --optimize [--user=<user_name>] [--password=<password>] [--all-databases]
#or
mysql -u${MYSQL_USER_NAME} -p${MYSQL_PASSWORD} -h${MYSQL_HOST} ${MYSQL_DATABASE} --execute="OPTIMIZE TABLE ${TABLE_NAME_TO_TAKE_CARE_OF};"
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
