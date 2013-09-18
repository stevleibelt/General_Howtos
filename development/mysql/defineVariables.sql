SET @myVar = 'foo';

SET @myVar = (SELECT 
  GROUP_CONCAT(DISTINCT `t`.`id`) 
FROM 
  `my_table` AS `t` 
WHERE 
  `t`.`my_column` LIKE '%my parameter%';

SELECT 
  foo
FROM
  bar
WHERE
  foobar = @myVar;
