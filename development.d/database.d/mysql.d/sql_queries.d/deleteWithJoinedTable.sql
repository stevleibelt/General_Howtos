-- delete with join
-- only tables listed in the DELETE are used for deletion
-- @see: https://dev.mysql.com/doc/refman/5.7/en/delete.html <-- Multi-Table Deletes

DELETE
    `t1` -- you don't need to use alias
FROM 
    `table_one` AS `t1`
    LEFT JOIN `table_two` AS `t2` 
        ON `t1`.`id` = `t2`.`t1_id`
WHERE
    `t2`.`id` IS NOT NULL
    AND `t2`.`foo` = 'bar';
