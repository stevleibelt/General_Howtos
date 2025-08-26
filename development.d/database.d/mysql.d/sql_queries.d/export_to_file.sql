-- database dumps
-- see: http://dev.mysql.com/doc/refman/5.1/en/mysqldump.html

```
mysqldump -u username -p database_name > dump.sql
```

-- with gzipg

```
mysqldump -u username -p database_name | gzip > dump.sql.gz
```

-- a table

```
mysqldump -u username -p database_name table_name > dump.sql
```

-- queries
-- see:
--  http://www.tech-recipes.com/rx/1475/save-mysql-query-results-into-a-text-or-csv-file/
-- dump to text file

    SELECT * FROM `foo`
    INTO OUTFILE '/path/to/text/file'

-- dump to csv file

    SELECT * FROM `foo`
    INTO OUTFILE '/path/to/csv/file.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'

-- or use a statement and pipe it into a file

mysql -u <username> -p <database name> < my_statement.sql > my_result.txt

-- ERROR 1045 (28000): Access denied for user 
-- 
-- http://mamchenkov.net/wordpress/2011/04/27/mysql-export-csv-into-outfile-triggers-access-denied-error/
-- USE mysql;
-- UPDATE user SET File_priv = 'Y' WHERE User = '<your user>';
-- FLUSH PRIVILEGES;
-- 
-- http://lists.mysql.com/mysql/40110
-- GRANT FILE ON *.* to person@"%";
