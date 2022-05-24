-- copies entries from one table to another

CREATE TABLE 
    `my_destination_table`
SELECT 
-- you can also choose just a few columns
    * 
FROM
    `my_source_table` AS `source`
-- optional
WHERE 
    `source`.`created_at` = NOW();

-- copies data and structure (indexes etc.)

CREATE TABLE
    `my_destination_table`
LIKE
    `my_source_table`;

INSERT INTO
    `my_destination_table`
SELECT
     *
FROM
    `my_source_table`;
