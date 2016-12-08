-- 
-- @see
--  https://dev.mysql.com/doc/refman/5.7/en/load-data.html
--  http://stackoverflow.com/questions/10762239/mysql-enable-load-data-local-infile
--  http://dba.stackexchange.com/questions/48751/enabling-load-data-local-infile-in-mysql
-- 

-- 
-- load text file into table
-- 

LOAD DATA INFILE 'file.txt'
INTO TABLE <table name>

-- 
-- load csv file into table and replace possible existing values
-- 

LOAD DATA LOCAL INFILE 'database.csv' 
REPLACE INTO TABLE <my table> 
FIELDS TERMINATED BY ';' ENCLODES BY '\"' LINES TERMINATED BY '\n'
(<column_one>, <column_two>)
