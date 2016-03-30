-- 
-- based on: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html#function_concat
-- 

-- concat strings

SELECT 
    CONCAT (`column_one`, `column_two`) 
FROM
    `my_table`

-- concat strings with separator

SELECT 
    CONCAT_WS ('my_separator', `column_one`, `column_two`) 
FROM
    `my_table`

-- group concat strings with separator
-- based on: http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html#function%5Fgroup-concat

SELECT
    GROUP_CONCAT(`my_table`.`id` SEPARATOR ', ')
FROM
    `my_table`

-- concat by using a subquery

SELECT
    `my_table`.`id`,
    (
        SELECT
            GROUP_CONCAT(`my_column` SEPARATOR ', ')
        FROM
            `my_other_table`
        WHERE
            `my_other_table`.`my_table_id` = `my_table`.`id`
    ) AS `my other table entries`
FROM
    `my_table`
