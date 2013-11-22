-- 
-- taken from: http://dev.mysql.com/doc/refman/5.1/en/control-flow-functions.html
--

SELECT 
    IF (`my_column` > 0, 'yes', 'no')
FROM
    `my_table`
