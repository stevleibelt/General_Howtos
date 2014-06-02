-- "_" signigies one character
-- "%" signifies zero to infinity number of characters
-- http://dev.mysql.com/doc/refman/5.0/en/string-comparison-functions.html#operator%5Flike

SELECT 
    * 
FROM 
    `my_table` 
WHERE 
    `my_column` LIKE '_foo%';   -- searching for [0-9|a-z|A-Z]foo*
