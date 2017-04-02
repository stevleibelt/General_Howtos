-- for innodb
SHOW ENGINE INNODB STATUS

-- table status
-- by using table status
SHOW 
    TABLE STATUS 
FROM 
    `<database name>`
WHERE 
    `name` LIKE '<table name>' ;
-- the same but with different statement
SELECT 
    *
FROM  
    INFORMATION_SCHEMA.TABLES
WHERE 
    TABLE_SCHEMA = '<database name>'
    AND TABLE_NAME = '<table name>';
