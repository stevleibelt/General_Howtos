-- 
-- https://dev.mysql.com/doc/refman/5.0/en/string-functions.html
-- https://dev.mysql.com/doc/refman/5.0/en/string-functions.html#function_substr
-- 

SELECT SUBSTRING('foobarbar', 4); -- 'barbar'
SELECT SUBSTRING('foobarbar' FROM 4); -- 'barbar'

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
  substring(`s`.`json`, LOCATE('myVar":[', `s`.`json`), (LOCATE(']', `s`.`json`, LOCATE('myVar":[', `s`.`json`)) -  LOCATE('myVar":[', `s`.`json`) + 1)) AS `parameters`
FROM
  `my_table_to_search_in` AS `s` 
WHERE 
  substring(`s`.`json`, LOCATE('myVar":[', `s`.`json`), (LOCATE(']', `s`.`json`, LOCATE('myVar":[', `s`.`json`)) -  LOCATE('myVar":[', `s`.`json`) + 1)) LIKE '%parameter value to search for%';
