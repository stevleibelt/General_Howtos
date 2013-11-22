--
-- based on: http://dev.mysql.com/doc/refman/5.1/en/control-flow-functions.html
--

SELECT 
    `my_table`.`my_column` AS `my_table_column`
    CASE
        WHEN `my_table`.`my_other_column` IS NULL
            THEN 'no other column entry'
        ELSE
            CASE
                WHEN (
                    SELECT
                        `my_other_table`.`my_column_with_named_value`
                    FROM
                        `my_other_table`
                    WHERE
                        `my_other_table`.`my_column` = `my_table`.`my_column`
                    ) = 'my_expected_named_value'
                    THEN 'thats my value'
                ELSE
                    'i can not handle this value'
            END
    END AS `my_case_table`
FROM
    `my_table`;
