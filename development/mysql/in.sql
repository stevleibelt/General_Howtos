-- 
-- fetch entries fitting to a collection of values
-- 

SELECT
    *
FROM
    `my_table`
WHERE
    `id` IN (1,2,3);

-- 
-- fetch entries fitting to result from a subquery
-- 

SELECT
    *
FROM
    `my_table`
WHERE
    `id` IN (
        SELECT
            `my_table_id`
        FROM
            `my_other_table`
        WHERE
            `my_boolean_column` = 1
    );


-- 
-- fetch entries not fitting to a collection of values
-- 

SELECT
    *
FROM
    `my_table`
WHERE
    `id` NOT IN (1,2,3);
