-- current datetime
SET @TODAY = DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s');
-- current date
SET @TODAY = CURRENT_DATE;


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

-- select datetime range
-- within the same day
SELECT * 
FROM `table_one` 
WHERE `datetime_column` LIKE '2014-04-22%';

-- between with start and end date
SELECT *
FROM `table_one`
WHERE `datetime_column` BETWEEN '2014-04-21 00:00:00' AND '2014-04-21 23:59:59';

-- between start and calculated end date
-- start date is current date
-- end date is current date plus one day
SELECT *
FROM `table_one`
WHERE `datetime_column` BETWEEN CURRENT_DATE AND (CURRENT_DATE + INTERVAL 1 DAY - INTERVAL 1 SECOND)

-- calculate difference between two dates
-- @see: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html#function_period-diff
SELECT DATEDIFF('1970-01-01 00:00:00', '1983-10-06 00:00:00');
-- @see: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html#function_timediff
SELECT TIMEDIFF('1970-01-01 00:00:00', '1983-10-06 00:00:00');
-- @see: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html#function_timestampdiff
SELECT TIMESTAMPDIFF(MONTH, '1970-01-01 00:00:00', '1983-10-06 00:00:00'); -- MONTH, YEAR, MINUTE

-- format an calculate average of difference between two dates
SELECT
    TIME_FORMAT(
        AVG(
            TIMEDIFF(
                NOW(),
                '1983-10-06 00:00:00'
            )
        ),
        '%H:%i:%s'
    ) AS `difference`;
