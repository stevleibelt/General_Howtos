-- Delete first 2000 matching rows

DELETE FROM
  `my_table` 
WHERE 
  `my_table`.`id` = $value 
ORDER BY 
  `my_table`.`id` ASC 
LIMIT 2000;
