-- 
-- some usefull select statements
-- 

-- [EXPLAIN]
-- SELECT [DISTINCT] 
--     `table_alias`.`column_one` [AS `column_alias`]
-- FROM 
--     `source_table` [ [AS] `table_alias`]
-- [WHERE ]
-- [GROUP BY ]
-- [HAVING ]
-- [ORDER BY [ASC|DESC])]
-- [LIMIT];

-- create md5 based on current unix timestamp
SELECT md5(UNIX_TIMESTAMP());

-- if you need to display text
SELECT IF(`my_column` IS NULL, 'no', 'yes') AS `Status`;

-- 
-- Count(*) vs Count(<string: column_name>)
-- @see: https://www.percona.com/blog/count-vs-countcol-in-mysql/
-- 

-- 
-- useing explain to get detail informations
-- use \G to get extended view
-- @see: https://dev.mysql.com/doc/refman/5.0/en/explain-extended.html
-- 
EXPLAIN [EXTENDED] SELECT
    *
FROM
    `my_table`
-- WHERE 
--     add your condition
[\G];

-- 
-- explicit tell mysql to use this index
-- @see: http://forums.mysql.com/read.php?10,99557
-- 

SELECT
    <my column>
FROM
    <my table>
    USE INDEX(<my index>);

-- 
-- Detect duplicate entries by multiple columns
-- 
SELECT
    mt1.`column_one`,
    mt1.`column_two`,
    mt1.`column_three`,
    mt1.`column_four`
FROM
    `my_table` AS mt1
    JOIN `my_table` AS mt2
        ON (
            mt1.`column_one` != mt2.`column_one`
            AND mt1.`column_two` = mt2.`column_two`
            AND mt1.`column_three`= mt2.`column_three`
            AND mt1.`column_four` = mt2.`column_four`
        );

-- 
-- Detect duplicated entries
-- Not working good with multiple columns
-- 
SELECT 
    *
FROM 
    `my_table`
GROUP BY 
    `column_one`
HAVING 
    COUNT(*) > 1 
-- this is optional
ORDER BY 
    `column_one` DESC;

-- 
-- Sum things up.
-- Create "left" to do
-- @see: https://dev.mysql.com/doc/refman/5.7/en/group-by-functions.html#function_sum
-- 

SELECT
    COUNT(*) AS 'total',
    SUM(`column_one` = 1 OR `column_two` = 1) AS `done`
    COUNT(*) - SUM(`column_one` = 1 OR `column_two` = 1) AS `left_to_do`
FROM
    `my_table`
