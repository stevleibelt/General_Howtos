-- 
-- http://www.brainbell.com/tutorials/MySQL/Performing_Mathematical_Calculations.htm
-- 

SELECT 
  (1+2) AS '1+2',
  (2-1) AS '2-1',
  (3*3) AS '3*3',
  (6/2) AS '6/2';

--- 
--- Increase value in your column by one
--- 


UPDATE
    `table_name`
SET
    `column_name`=(`column_name`+1)
--- WHERE
--- ...

