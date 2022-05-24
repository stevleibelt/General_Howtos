-- Since 2019-02-29
--  With modern mysql servers, it is faster to use INSERT ON DUPLICATE KEY UPDATE instead.
--  https://dev.mysql.com/doc/refman/5.7/en/insert-on-duplicate.html
-- 

-- instead of an update, a replace deletes the current entry and inserts a new one

REPLACE INTO 
  `my_table` 
(`column_1`, `column_2`) 
VALUES (
  'foo', 
  23
);

-- update and replace parts of the string

UPDATE 
    `table_one`
SET 
    `my_column` = REPLACE(`my_column`, 'search_string', 'replace_string');

-- replace with a join

UPDATE 
    `table_one` AS `t1`
INNER JOIN `table_two` AS `t2` 
    ON `t1`.`column_one` = `t2`.`columne_one` -- or whatever join condition you need
SET 
    `t1`.`long_string` = REPLACE(`t1`.`long_string`, `t2`.`search_string`, `t2`.`replace_string`);
