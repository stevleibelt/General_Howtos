-- @link: https://stackoverflow.com/a/2630509
DELETE FROM 
    `my_table` 
WHERE 
    id IN (
        SELECT 
            all_duplicates.id 
        FROM (
           SELECT 
                id
            FROM 
                `my_table` 
            WHERE
                `my_column` IN (
                    SELECT
                        `my_column`
                    FROM 
                        `my_table` 
                    GROUP BY 
                        `my_column` HAVING COUNT(*) > 1
                )
        ) AS all_duplicates
        LEFT JOIN (
            SELECT
                id
            FROM
                `my_table`
            GROUP BY
                `my_column` HAVING COUNT(*) > 1
        ) AS grouped_duplicates
        ON (
            all_duplicates.id = grouped_duplicates.id
        )
        WHERE 
            grouped_duplicates.id IS NULL
    );
