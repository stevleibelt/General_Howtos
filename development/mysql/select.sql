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
