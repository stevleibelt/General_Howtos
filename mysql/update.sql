-- simple update
UPDATE 
    `my_table` 
SET 
    `my_column` = 666 
WHERE 
    `my_column` <> 666;

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

-- update by using same table
UPDATE 
    `my_table` as `destination` 
    INNER JOIN `my_table` as `source` 
        IN (`destination`.`parent_id` = `source`.`id` 
SET 
    `destination`.`another_id` = `source`.`another_id` 
WHERE 
    `destination`.`parent_id` IS NOT NULL 
    AND `destination`.`another_id` IS NULL 
    AND `source`.`another_id` IS NOT NULL;

-- updating mutliple tables
-- http://dev.mysql.com/doc/refman/5.0/en/update.html
UPDATE
    `my_table_one`, `my_table_two`
SET
    `my_table_one`.`column_one` = 'foo',
    `my_table_two`.`column_one` = 'bar'
WHERE 
    `my_table_one`.`column_two` = 'foobar',
    AND `my_table_two`.`column_two` = 'foobar';
