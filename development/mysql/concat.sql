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

SELECT
    GROUP_CONCAT(`my_table`.`id` SEPARATOR ', ')
FROM
    `my_table`
