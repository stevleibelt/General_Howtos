-- trim left and right
-- https://dev.mysql.com/doc/refman/5.0/en/string-functions.html#function_trim

SELECT TRIM('  foobar   ');

-- ltrim
-- https://dev.mysql.com/doc/refman/5.0/en/string-functions.html#function_ltrim

SELECT LTRIM('  foobar');

-- rtrim
-- https://dev.mysql.com/doc/refman/5.0/en/string-functions.html#function_rtrim

SELECT LTRIM('foobar  ');
