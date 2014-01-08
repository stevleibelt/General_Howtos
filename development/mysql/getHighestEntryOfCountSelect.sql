#!/bin/mysql

--- 
--- we need get the highest value (maxium number of counts) per id
--- 

SELECT
    MAX(count_per_my_id)
FROM
    (
    SELECT 
        user_id, 
        COUNT(id) AS count_per_my_id
    FROM
        my_table
    GROUP BY
        my_id
    ) AS counting_table;
