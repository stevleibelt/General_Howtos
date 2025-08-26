SELECT 
  t1.* 
FROM 
  `table1` AS `t1` 
  LEFT JOIN `table2` AS `t2` 
    ON `t1`.`id` = `t2`.`table1_id` 
WHERE 
  `t2`.`id` IS NULL;
