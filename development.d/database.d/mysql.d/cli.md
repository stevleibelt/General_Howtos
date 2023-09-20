# list process

```
SHOW PROCESSLIST;
#verbose
SHOW FULL PROCESSLIST;
```

# kill process

```
kill [connection|query] <id>
```
# get available runtime variables

```
SELECT * FROM `information_schema`.`global_variables`;
#get all settings for innodb
SELECT * FROM GLOBAL_VARIABLES WHERE `variable_name` LIKE 'innodb%';
```

# from the shell

```
#SHOW PROCESSLIST
mysqladmin --user=<user name> --password=<password> processlist
#SHOW FULL PROCESSLIST
mysqladmin --user=<user name> --password=<password> processlist --verbose
```

# links

* https://dev.mysql.com/doc/refman/5.0/en/kill.html
