-- get

SELECT 
    `auto_increment`
FROM  
    INFORMATION_SCHEMA.TABLES
WHERE 
    TABLE_SCHEMA = '<database name>'
    AND TABLE_NAME = '<table name>';

-- 
-- set
-- http://ariejan.net/2007/11/30/mysql-reset-the-auto-increment-value-of-a-table
-- 

ALTER TABLE 
    `table_name`
    AUTO_INCREMENT=<value>;
