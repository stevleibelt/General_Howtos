-- current datetime
SET @TODAY = DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s');
-- current date
SET @TODAY = CURRENT_DATE;


-- @see:
--  http://w3resource.com/mysql/date-and-time-functions/mysql-adddate-function.php
--  https://dev.mysql.com/doc/refman/5.7/en/date-and-time-functions.html#function_date-add
-- also working for datetime columns
-- valid units          with expected expression format
--  MICROSECONDS        <float>
--  SECOND              <int>
--  MINUTE              <int>
--  HOUR                <int>
--  DAY                 <int>
--  WEEK                <int>
--  MONTH               <int>       [1-12]
--  QUARTER             <int>       [1-4]
--  YEAR                <int>
--  SECOND_MICROSECOND  <float>     'SECONDS.MICROSENCODS'
--  MINUTE_MICROSECOND  <string>    'MINUTES:SECONDS.MICROSENCODS'
--  MINUTE_SECOND       <string>    'MINUTES_SECONDS'
--  HOUR_MICROSECOND    <string>    'HOURS:MINUTES:SECONDS.MICROSECONDS'
--  HOUR_SECOND         <string>    'HOURS:MINUTES_SECONDS'
--  HOUR_MINUTE         <string>    'HOURS:MINUTES'
--  DAY_MICROSECOND     <string>    'DAYS HOURS:MINUTES:SECONDS.MICROSECONDS'
--  DAY_SECOND          <string>    'DAYS HOURS:MINUTES:SECONDS'
--  DAY_MINUTE          <string>    'DAYS HOURS:MINUTES'
--  DAY_HOUR            <string>    'DAYS HOURS'
--  YEAR_MONTH          <string>    'YEARS-MONTHS'
-- substract days
SELECT DATE_SUB('2012-12-21', INTERVAL 10 DAY);

-- add days
SELECT DATE_ADD('2012-12-21', INTERVAL 10 DAY);
--  if you add a negative value, it will get substracted
SELECT DATE_ADD('2012-12-21', INTERVAL -10 DAY);

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

-- get all entries starting 10 minutes in the past
SELECT
    *
FROM
    `my_table`
WHERE
    `my_date_time_column` < NOW() - INTERVAL 10 MINUTE;
