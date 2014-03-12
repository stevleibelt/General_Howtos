-- remove content
DELETE FROM 
  `my_table` 
WHERE 
  `my_table`.`id` = $value

-- Delete first 2000 matching rows
DELETE FROM
  `my_table` 
WHERE 
  `my_table`.`id` = $value 
ORDER BY 
  `my_table`.`id` ASC 
LIMIT 2000;

-- delete with self reference
DELETE 
    `table` 
FROM 
    `my_table` AS `table` 
    LEFT JOIN `other_table` AS `other` 
        ON `table`.`other_table_id` = `other`.`id` 
WHERE 
    `table`.`other_table_id` IS NOT NULL 
    AND `other`.`status` = 'foo';
