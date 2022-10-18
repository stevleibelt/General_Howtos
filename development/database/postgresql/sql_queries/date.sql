-- 
-- @see
--  https://www.postgresql.org/docs/9.1/functions-datetime.html
-- 

-- timestamp of the current day

SELECT
    current_date + time '00:00:00' AS begin_timestamp,
    current_date + time '23:59:59' AS end_timestamp
;

-- current year, current month, current semester as integer for calculation

SELECT
  -- fetch year from current date and convert it to smallint
  ((DATE_PART('year', CURRENT_DATE)::smallint)) AS current_year,
  -- fetch month from current date and convert it to small int
  ((DATE_PART('month', CURRENT_DATE)::smallint)) AS current_month,
  -- fetch month from current date, convert it to small int and compare the value
  --    if month is greater 6, we are in the second semester, else first semester
  (CASE WHEN ((DATE_PART('month', CURRENT_DATE)::smallint) > 6) THEN 2 ELSE 1 END) AS current_semester;

-- calculate interval

WITH my_values (my_date) AS (
    VALUES
        ('2014-06-12'::date),
        ('2014-06-13'::date),
        ('2014-06-25'::date),
        ('2014-06-26'::date)
)
SELECT
    my_values.my_date,
    my_values.my_date - '14 days'::interval AS minus_14_days
FROM
    my_values;

-- comparing dates

WITH my_values (my_date) AS (
    VALUES
        ('2014-06-12'::date),
        ('2014-06-13'::date),
        ('2014-06-25'::date),
        ('2014-06-26'::date)
)
SELECT
    source_date.my_date AS date_to_compare,
    source_date.my_date - '14 days'::interval AS date_to_compare_minus_14_days,
    validation_date.my_date AS date_in_range
FROM
    my_values as source_date
    JOIN my_values AS validation_date
    ON (
        -- if you replace `>=` with `>`, we would generate an empty result set
        source_date.my_date >= validation_date.my_date + '14 days'::interval
    );

