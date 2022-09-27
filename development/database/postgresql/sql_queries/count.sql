-- 
-- @see
-- 

-- 
-- All about counting
-- 

SELECT 
    COUNT(*) AS count_all_rows_1,
    COUNT(1) AS count_all_rows_2,
    COUNT(my_column) AS count_all_non_null_rows,
    COUNT(DISTINCT my_column) AS count_all_unique_non_null_rows
FROM
    my_table;

