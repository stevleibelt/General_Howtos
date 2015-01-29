-- 
-- simple example
-- https://dev.mysql.com/doc/refman/5.0/en/insert-on-duplicate.html
-- 

INSERT INTO my_table 
    (column_one, column_two) 
VALUES 
    (1, 2) 
ON DUPLICATE KEY UPDATE 
    column_two=2, updated_at=NOW();

-- 
-- example with subselect
-- https://dev.mysql.com/doc/refman/5.0/en/insert-select.html
-- http://stackoverflow.com/questions/2472229/insert-into-select-from-on-duplicate-key-update
-- http://blog.astaz3l.com/2013/11/22/mysql-on-duplicate-key/
-- http://www.percona.com/blog/2007/01/18/insert-on-duplicate-key-update-and-replace-into/
-- 

-- my_table.other_table_id and other_table.id need to have a unique index

INSERT INTO my_table 
    (other_table_id, other_table_name) 
SELECT 
    other_table.id, other_table.name
FROM
    other_table
WHERE
    other_table.date >= '1970-01-01 00:00:00'
ON DUPLICATE KEY UPDATE 
    my_table.other_table_name = other_table.name

