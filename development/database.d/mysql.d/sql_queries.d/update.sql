-- 
-- simple update
-- 

UPDATE 
    `my_table` 
SET 
    `my_column` = 666 
    [, `my_other_column` = 13]
WHERE 
    `my_column` <> 666;

-- 
-- if not exists (easier than a left join)
-- @see: https://dev.mysql.com/doc/refman/5.0/en/exists-and-not-exists-subqueries.html
-- 

UPDATE
    `my_table` 
SET 
    `my_column` = 666 
WHERE 
    `my_column` <> 666
    AND NOT EXISTS (SELECT * FROM `my_other_table` WHERE `my_table`.`my_other_table_id` = `my_other_table`.`id`);

-- 
-- with limit
-- @see: https://dev.mysql.com/doc/refman/5.0/en/update.html
-- 

UPDATE
    `my_table` 
SET 
    `my_column` = 666 
LIMIT
    1000;
-- if you want to use an update within a join, use a subselect
-- @link: https://www.xaprb.com/blog/2006/08/10/how-to-use-order-by-and-limit-on-multi-table-updates-in-mysql/
-- @link: https://www.xaprb.com/blog/2006/08/03/a-little-known-way-to-cause-a-database-deadlock/

-- 
-- if you can not use limit, "id BETWEEN 0 AND 10000"
-- 
