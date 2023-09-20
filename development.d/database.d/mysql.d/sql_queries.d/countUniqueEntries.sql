-- 
-- 
-- 

SELECT 
  COUNT(DISTINCT `my_table`.`my_column`) 
FROM 
  `my_table` AS `t` 
[
  LEFT JOIN `my_second_table` AS `t2` 
    ON (`t`.`id` = `t2`.`my_table_id` 
        AND `t2`.`is_online` = 1)
]
[
WHERE 
  `t`.`my_column` = 'my_value`
]
