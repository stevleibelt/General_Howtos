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
