--- Calculate average of column and runtime grouped by a fitting column

SELECT 
    *, 
    AVG(`number_of_something`) AS `average_of_something`, 
    AVG(TIMEDIFF(`finished_at`, `started_at`)) AS `average_of_time`
FROM 
    `my_table` 
GROUP BY 
    `my_column`;
