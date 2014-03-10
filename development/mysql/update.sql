-- 
-- simple update
-- 

UPDATE 
    `my_table` 
SET 
    `my_column` = 666 
    [, `my_other_column` = 13]
WHERE 
    `my_column` <> 666;
