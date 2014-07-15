-- see: http://dev.mysql.com/doc/refman/5.1/en/mysqldump.html

mysqldump -u username -p database_name > dumpFile.sql

-- with gzipg

mysqldump -u username -p database_name | gzip > dumpFile.sql.gz
