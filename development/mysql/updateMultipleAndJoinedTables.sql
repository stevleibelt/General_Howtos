--- update multiple and joined tables
-- http://stackoverflow.com/questions/806882/update-multiple-tables-in-mysql-using-left-join
UPDATE 
    `my_table_one` AS `t1`
JOIN
    `my_table_two` AS `t2`
    ON `t1`.`t2_id` = `t2`.`id`
JOIN
    `my_table_three` AS `t3`
    ON `t1`.`t3_id` = `t3`.`id`
SET 
    `t1`.`columne_one` = `t3`.`column_one`
