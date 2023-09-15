-- based on copy and delete example
-- moves entries from one table to another
-- this is a two step process, first copy values to destination and then delete all copied from source

SET @MY_STATUS_CRITERIA = 'done';

CREATE TABLE 
    `my_destination_table`
SELECT 
    * 
FROM
    `my_source_table` AS `source`
WHERE 
    `source`.`status` = @MY_STATUS_CRITERIA;

DELETE 
    `source`
FROM
    `my_source_table` AS `source`
    -- join the destination to delete only entries from source that are in the destination
    -- you should only join on keys with an index, otherwise things where getting quite slow
    JOIN `my_destination_table` AS `destination`
        ON (`source`.`id` = `destination`.`id`)
WHERE
    `source`.`status` = @MY_STATUS_CRITERIA;
    -- hint, to speed up things, try to use a time based criteria for destination
    --  to scope down the number of results
