-- remove content

DELETE FROM 
  `my_table` 
WHERE 
  `my_table`.`id` = $value
