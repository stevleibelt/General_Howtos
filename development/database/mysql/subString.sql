-- 
-- https://dev.mysql.com/doc/refman/5.0/en/string-functions.html
-- https://dev.mysql.com/doc/refman/5.0/en/string-functions.html#function_substr
-- 

-- get first three characters

SELECT SUBSTRING('foobar', 1, 3); -- 'foo'

-- get last three characters

SELECT SUBSTRING('foobar', -3); -- 'bar'

-- general

SELECT SUBSTRING('foobarbar', 4); -- 'barbar'
SELECT SUBSTRING('foobarbar' FROM 4); -- 'barbar'

-- matching on last character (".")

SELECT * FROM `my_table` WHERE SUBSTRING(`my_column`, -1) = '.';

-- 
-- assuming you have entries in json format and want to retrieve entries with matching parametervalues
--
-- you have a table "my_table_to_search_in" with a text column called "json" where you store a json encoded object/array of parameters
-- you are searching for the key "myVar" that has the parameter "parameter value to search for" inside
--

SELECT
  LOCATE('myVar":[', `s`.`json`) AS `position_start`,
  LOCATE(']', `s`.`json`, LOCATE('myVar":[', `s`.`json`)) AS `position_stop`,
  (LOCATE(']', `s`.`json`, LOCATE('myVar":[', `s`.`json`)) -  LOCATE('myVar":[', `s`.`json`) + 1 ) AS `string_length`,
  SUBSTRING(`s`.`json`, LOCATE('myVar":[', `s`.`json`), (LOCATE(']', `s`.`json`, LOCATE('myVar":[', `s`.`json`)) -  LOCATE('myVar":[', `s`.`json`) + 1)) AS `parameters`
FROM
  `my_table_to_search_in` AS `s` 
WHERE 
  SUBSTRING(`s`.`json`, LOCATE('myVar":[', `s`.`json`), (LOCATE(']', `s`.`json`, LOCATE('myVar":[', `s`.`json`)) -  LOCATE('myVar":[', `s`.`json`) + 1)) LIKE '%parameter value to search for%';

-- 
-- group by substring
-- assuming you want to group by a given suffix (like email providers)
-- fetch the substring by removing the unique identifiers (email) and group by the created string
-- 

SELECT
    SUBSTRING(`my_column`, LOCATE('my_search_string', `my_column`)) AS my_to_group_column
FROM
    `my_table`
GROUP BY 
    `my_to_group_column`;

-- 
-- easy substring when you want to get "from the beginning until" strings
-- e.g. you want to have the local part from an email address
-- @see:
    https://dev.mysql.com/doc/refman/5.0/en/string-functions.html#function_substring-index
-- 

SELECT
    SUBSTRING_INDEX(`email_address`, '@', 1)
FROM
    `my_table`;

-- 
-- sub string until needle is found for the first time
--

SELECT
    SUBSTRING_INDEX('there is no foo without a bar!', ' without a bar!', 1);
-- will return
--  there is no foo
