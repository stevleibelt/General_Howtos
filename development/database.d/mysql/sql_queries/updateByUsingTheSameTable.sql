-- 
--- update by using same table
-- 

UPDATE 
    `my_table` as `destination` 
    INNER JOIN `my_table` as `source` 
        ON (`destination`.`parent_id` = `source`.`id` 
SET 
    `destination`.`another_id` = `source`.`another_id` 
WHERE 
    `destination`.`parent_id` IS NOT NULL 
    AND `destination`.`another_id` IS NULL 
    AND `source`.`another_id` IS NOT NULL;
