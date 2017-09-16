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

-- 
-- Fix InnoDB statistics with almost no impact on a live server
-- 
-- @link https://www.percona.com/blog/2017/09/11/updating-innodb-table-statistics-manually/
-- 
```php
$ php -r '
$link = new mysqli("127.0.0.1", "root", "", "test", 13001);
$link->query("set lock_wait_timeout=1");
while(!$link->query("lock table goods write")) {sleep(1);}
$link->query("flush table goods");
$link->query("unlock tables");'
```
