SELECT 
  GROUP_CONCAT(DISTINCT `t`.`id`) 
FROM 
  `my_table` AS `t` 
