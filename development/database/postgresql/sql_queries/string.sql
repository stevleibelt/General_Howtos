-- 
-- @see
--  https://www.dcodeman.com/string-concatenation-using-pipe-operator-in-postgresql/ - 20220926
-- 

-- BO: Concating strings
-- Deal with possible null values when concating strings
--  We want to create the following string from pieces
--      'There', 'is', 'no', NULL, 'foo', 'without', 'a', 'bar'

-- Using pipes
SELECT 'There' || 'is' || 'no' || NULL || 'foo' || 'without' || 'a' || 'bar';

-- Using concat
SELECT CONCAT('There', 'is', 'no', NULL, 'foo', 'without', 'a', 'bar');

-- Using concat
-- First string is the separator
SELECT CONCAT_WS('-', 'There', 'is', 'no', NULL, 'foo', 'without', 'a', 'bar');
-- EO: Concating strings

-- Trim
SELECT '----' || TRIM(' there is no foo without a bar    ') || '----';

-- Check that string only contains numbers and format then
WITH my_values (my_string) AS (
    VALUES
        ('01'),
        ('2014'),
        ('2014-06-25'),
        ('Text')
)
SELECT
    my_values.my_string AS original_string,
    CASE WHEN my_values.my_string ~'^[0-9]+$' THEN my_values.my_string::DECIMAL ELSE 'NaN' END AS optional_decimal_number,
        CASE WHEN my_values.my_string ~'^[0-9]+$' THEN TO_NUMBER(my_values.my_string, 'FM999') ELSE 'NaN' END AS optional_formatted_number
FROM my_values;

