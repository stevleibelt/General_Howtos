-- 
-- @see
--  https://www.postgresql.org/docs/9.1/functions-datetime.html
-- 

-- timestamp of the current day

SELECT
    current_date + time '00:00:00' AS begin_timestamp,
    current_date + time '23:59:59' AS end_timestamp
;
