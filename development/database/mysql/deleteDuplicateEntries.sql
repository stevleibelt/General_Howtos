-- my way
DELETE
    mt1
FROM
    `my_table` AS mt1
    JOIN `my_table` AS mt2
        ON (
            mt1.`column_one` != mt2.`column_one`
            AND mt1.`column_two` = mt2.`column_two`
            AND mt1.`column_three`= mt2.`column_three`
            AND mt1.`column_four` = mt2.`column_four`
        );

-- @link: https://stackoverflow.com/a/2630509
-- boy is this complicated
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
