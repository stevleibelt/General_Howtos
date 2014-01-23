-- 
-- updating mutliple tables
-- http://dev.mysql.com/doc/refman/5.0/en/update.html
-- 

UPDATE
    `my_table_one`, `my_table_two`
SET
    `my_table_one`.`column_one` = 'foo',
    `my_table_two`.`column_one` = 'bar'
WHERE 
    `my_table_one`.`column_two` = 'foobar',
    AND `my_table_two`.`column_two` = 'foobar';
