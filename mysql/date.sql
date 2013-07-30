-- current date
SET @TODAY = DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s');

-- source: http://w3resource.com/mysql/date-and-time-functions/mysql-adddate-function.php
-- substract days
SELECT SUBDATE('2012-12-21', INTERVAL 10 DAY);

-- add days
SELECT ADDDATE('2012-12-21', INTERVAL 10 DAY);

-- add NOW() to a DATETIME (YYYY-MM-DD HH:MM:SS)
INSERT INTO datetime_column = DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s');

-- get weekday by date
-- source: http://dev.mysql.com/doc/refman/5.1/de/date-and-time-functions.html
-- returns 0 for monday, 1 for tuesday, ... 6 for sunday
SELECT WEEKDAY('2011-08-04');
