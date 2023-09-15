-- 
-- get minimum and maximum for all columns in a table
-- 

SELECT 
    MAX(`my_column`) AS maxium_of_my_table,
    MIN(`my_column`) AS minimum_of_my_table
FROM
    `my_table`
