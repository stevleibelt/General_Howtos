-- update with subselect
UPDATE 
    `my_table` as `mt` 
SET `mt`.`column_one`=(
    SELECT 
        `ot`.`column_two`
    FROM 
        `other_table` AS `ot` 
    WHERE 
        `ot`.`id` = `mt`.`other_table_id`)
WHERE `mt`.`column_two` = 0;
