-- http://dev.mysql.com/doc/refman/5.0/en/string-functions.html#function%5Flength
SELECT 
  * 
FROM 
  `my_table` AS `t` 
ORDER BY 
  length(`t`.`my_column`) DESC;
