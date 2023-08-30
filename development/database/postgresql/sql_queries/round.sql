-- 
-- @ref
--  https://www.postgresql.org/docs/current/functions-math.html
-- 

-- 
-- Replace round(double precission, integer) with a self created functionality
-- 
-- Assumed is that your column contains values of type double precision
--   PostgreSQL round with two arguments can only deal with type numeric
--   ref: https://www.postgresql.org/docs/current/functions-math.html
--   Because of that, we are replacing this functionality with a simple round
--       Shift the decimal point two digits to the right by multiplying with 100
--       Add 0.5 to handle rounding issues like 5.78
--       Floor this result, meaning remove all digits after the decimal point
--       Shift the decimal point two digits to the left by dividing with 100
--   Steps explained by a value:
--       5.8795362 -> 587.95362 -> 588.45362 -> 588 -> 5.88

-- SQL that should fail
SELECT round(my_column,2);
-- SQL that should work
SELECT floor(100*my_column+0.5)/100 as round;

