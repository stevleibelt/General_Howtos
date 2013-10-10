-- 
-- this statement groups selected content by a given column and delivers counted sub query results
-- 

SELECT
    `main`.`column_id` AS `main_column_id`,
    (
        SELECT
            count(`t`.`id`)
        FROM
            `my_table` AS `t`
        WHERE
            `t`.`column_id` = `main`.`column_id`
            AND `t`.`column_one` = 1
            AND `t`.`column_two` = 0
    ) AS `number_of_condition_one`,
    (
        SELECT
            count(`t`.`id`)
        FROM
            `my_table` AS `t`
        WHERE
            `t`.`column_id` = `main`.`column_id`
            AND `t`.`column_two` = 1
    ) AS `number_of_condition_two`
FROM
    `my_table` AS `main`
GROUP BY
    `main`.`column_id`
