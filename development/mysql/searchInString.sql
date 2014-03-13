-- You can use multiple ways to search a substring in one string
-- http://stackoverflow.com/questions/1386166/how-to-use-a-like-with-a-join-in-sql
-- http://stackoverflow.com/questions/2451608/which-is-faster-instr-or-like
-- 
-- An option to improve speed is to create a helper table with fulltext search
--
 
-- INSTR
-- http://dev.mysql.com/doc/refman/5.1/en/string-functions.html#function%5Finstr

SELECT * 
FROM `my_table` AS `t`
JOIN `other_table` AS `o`
  ON INSTR(`t`.`long_string`, `o`.`search_sub_string`) > 0;

-- LIKE

SELECT * 
FROM `my_table` AS `t`
JOIN `other_table` AS `o`
  ON `t`.`long_string` LIKE CONCAT('%', `o`.`search_sub_string`, '%');

-- LOCATE

SELECT * 
FROM `my_table` AS `t`
JOIN `other_table` AS `o`
  ON LOCATE(`o`.`search_sub_string`, `t`.`long_string`) > 0;

-- REGEXP

SELECT * 
FROM `my_table` AS `t`
JOIN `other_table` AS `o`
  ON `t`.`long_string` REGEXP `o`.`search_sub_string`;

-- performance
-- http://stackoverflow.com/a/22171511

-- 5.074 sec
-- SELECT BENCHMARK(100000000,INSTR('foobar','foo'));
-- 
-- 5.086 sec
-- SELECT BENCHMARK(100000000,LOCATE('foo','foobar')); 
-- 
-- 8.990 sec
-- SELECT BENCHMARK(100000000,'foobar' LIKE '%foo%');
-- 
-- 14.433 sec
-- SELECT BENCHMARK(100000000,'foobar' REGEXP 'foo'); 
-- 
-- 5.5.35-0ubuntu0.12.10.2 
-- SELECT @@version;
