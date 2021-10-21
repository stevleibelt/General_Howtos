# Backup and restore database

## Backup

```
#dump one database into plain file
mysqldump -u root -p <database_name> > <database_name>.sql

#dump one database into gzip'ed file
mysqldump -u root -p <database_name> | gzip > <database_name>.sql.gz

#dump multiple databases into plain file
mysqldump -u root -p --databases <database_name_one> <database_name_two> > <database_name_one_and_two>.sql

#dump all in one file
mysqldump -u root -p --all-databases > all_databases.sql

#dump all in one file per database with timestamp
#!/bin/bash
CURRENT_TIMESTAMP=$(date +%Y%m%d)
for DB in $(mysql -e 'SHOW DATABASES' -s --skip-colum-names); do
    mysqldump ${DB} > "${DB}_${CURRENT_TIMESTAMP}.sql";
done
```

## Restore

```
#if database does not exist
mysql -u root -p -e "CREATE DATABASE <database_name>"

#restore one database from one file
mysql -u root -p <database_name> < <database_name>.sql

#restore one database from one gzip'ed file
gunzip < <database_file>.sql.gz | mysql -u root -p <database_name>

#restore one database from file with multiple databases
mysql -u root -p --one-database <database_name> < all_databases.sql
```

# Links

* [mysqldump - MariaDB Knowledge Base](https://mariadb.com/kb/en/mysqldump/) - 20210902
* [How to Back Up and Restore MySQL Database with Mysqldump](https://linuxize.com/post/how-to-back-up-and-restore-mysql-databases-with-mysqldump/) - 20200506
```

# Links

* [MariaDb Knowledge Base: Backup and Restore Overview](https://mariadb.com/kb/en/backup-and-restore-overview/) - 20210902
* [MariaDB Knowledge Base: mysqldump](https://mariadb.com/kb/en/mysqldump/) - 20210902
* [How to Back Up and Restore MySQL Database with Mysqldump](https://linuxize.com/post/how-to-back-up-and-restore-mysql-databases-with-mysqldump/) - 20200506
