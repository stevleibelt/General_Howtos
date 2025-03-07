# Maintenance of MySQL Table

## Analyze Table

```bash
mysqlcheck --analyze [--user=<user_name>] [--password=<password>] [--all-databases]
#or
mysql -u${MYSQL_USER_NAME} -p${MYSQL_PASSWORD} -h${MYSQL_HOST} ${MYSQL_DATABASE} --execute="ANALYZE TABLE ${TABLE_NAME_TO_TAKE_CARE_OF};"
```

## Repair Table

```bash
mysqlcheck --repair [--user=<user_name>] [--password=<password>] [--all-databases]
#or
mysql -u${MYSQL_USER_NAME} -p${MYSQL_PASSWORD} -h${MYSQL_HOST} ${MYSQL_DATABASE} --execute="REPAIR TABLE ${TABLE_NAME_TO_TAKE_CARE_OF};"
```

## Optimize Table

```bash
mysqlcheck --optimize [--user=<user_name>] [--password=<password>] [--all-databases]
#or
mysql -u${MYSQL_USER_NAME} -p${MYSQL_PASSWORD} -h${MYSQL_HOST} ${MYSQL_DATABASE} --execute="OPTIMIZE TABLE ${TABLE_NAME_TO_TAKE_CARE_OF};"
```

## Do you want to know more?

```bash
man mysqlcheck
```

## All as SQL Statement

```mysql
-- @see: http://dev.mysql.com/doc/refman/5.7/en/analyze-table.html
ANALYZE TABLE `my_table`;

-- @see: http://dev.mysql.com/doc/refman/5.7/en/check-table.html
CHECK TABLE `my_table`;

-- @see: http://dev.mysql.com/doc/refman/5.7/en/repair-table.html
REPAIR TABLE `my_table`;

-- @see: http://dev.mysql.com/doc/refman/5.7/en/optimize-table.html
OPTIMIZE TABLE `my_table`;
```
