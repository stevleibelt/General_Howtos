-- 
-- this will select all entries of table_one with the newest and fitting entry of table_two
-- 
-- you can change the criteria of "newest" by chaning the order by column
-- the where requirements are only as an example
-- 

SELECT
    `t1`.*,
    `t2`.*
FROM
    `table_one` AS `t1` 
    JOIN (
        SELECT 
            `t21`.*
        FROM 
            `table_two` AS `t21`
        WHERE 
            `t21`.`column_one` = 1
        ORDER BY 
            `t21`.`id` DESC
    ) AS `t2`
    ON `t2`.`table_one_id` = `t1`.`id`
WHERE
    `t1`.`column_one` IS NULL
    AND `t2`.`column_two` = 0;
