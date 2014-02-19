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
