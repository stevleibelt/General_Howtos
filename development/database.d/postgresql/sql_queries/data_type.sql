-- 
-- @see
--  https://www.postgresql.org/docs/current/datatype.html
-- 

-- 
-- BO: DATE
-- 
SELECT
    CURRENT_DATE,
    DATE_PART('year', CURRENT_DATE) AS CURRENT_YEAR,
    CURRENT_DATE - '14 days'::interval AS 14_DAYS_IN_THE_PAST;
-- 
-- EO: DATE
-- 

-- 
-- BO: INTEGER
-- 
-- Cast int to string

WITH my_values (data) AS (
    VALUES
    (20211::smallint),
    (20212::smallint),
    (20191::smallint),
    (20121::smallint)
)
SELECT
    my_values.data,
    my_values.data::character AS unexpected_casting,
    CONCAT(my_values.data, '') AS expected_casting
FROM
    my_values;
-- 
-- EO: INTEGER
-- 

