mysql --user=user --password=password --database=database < ~/path/to/my/file

-- if you get some problems with umlauts, try to add a --default_character_set utf8 
mysql --user=user --password=password --default_character_set utf8 --database=database < ~/path/to/my/file

-- import from gzip
gunzip < $file.gz | mysql --user=user --password=password --default_character_set utf8 --database=database

-- bypass foreign key chec
SET foreign_key_checks = 0;
-- you sql code
SET foreign_key_checks = 1;
