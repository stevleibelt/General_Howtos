-- 
-- @author stev leibelt <artodeto@bazzline.net>
-- @since 2014-09-04
-- 

SELECT count(id) AS number_of_occurences
FROM `my_table` 
WHERE `my_column` = 'foo'
GROUP BY `my_column_with_multiple_occurences` 
ORDER BY `number_of_occurences` DESC
