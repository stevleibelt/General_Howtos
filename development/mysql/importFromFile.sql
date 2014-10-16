mysql --user=user --password=password --database=database < ~/path/to/my/file

-- if you get some problems with umlauts, try to add a --default_character_set utf8 
mysql --user=user --password=password --default_character_set utf8 --database=database < ~/path/to/my/file

-- import from gzip
gunzip < $file.gz | mysql --user=user --password=password --default_character_set utf8 --database=database

-- import from file
-- see
--  http://www.cyberciti.biz/faq/import-mysql-dumpfile-sql-datafile-into-my-database/
mysql -u <user name> -p -h <localhost> <database name> < <file name>

-- bypass foreign key chec
SET foreign_key_checks = 0;
-- you sql code
SET foreign_key_checks = 1;
