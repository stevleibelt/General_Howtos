# General

* run “mysql_update”, restart and see if error does still exist

# errno 152

* [“mysql drop foreign key error 152”](http://stackoverflow.com/questions/11649092/mysql-drop-foreign-key-error-152)
* you have to use the foreign key name of the constrain
* get this by doing

```mysql
SHOW CREATE TABLE `my_table_name`
```
