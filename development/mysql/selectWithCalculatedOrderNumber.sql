-- 
-- @author stev leibelt <artodeto@bazzline.net>
-- @since 2014-11-07
-- @see
--  http://stackoverflow.com/questions/2520357/mysql-get-row-number-on-select
--  http://stackoverflow.com/questions/5472030/current-row-id-or-row-number-in-php-mysql-query
-- 

-- 
-- by using a variable
-- 

SET @order_number=0;

SELECT 
    @order_number:=@order_number+1 AS order_number,
    `my_table`.`id`
FROM
    `my_table`
ORDER BY 
    order_number DESC;

-- 
-- by using count
-- 

SELECT 
    (SELECT count(*) FROM `my_table` AS order_table WHERE `order_table`.`id` < `my_table`.`id`)+1 AS order_number,
    `my_table`.`id`
FROM
    `my_table`
ORDER BY 
    order_number DESC;

-- 
-- experimental and untested code
-- as join
-- 

SELECT
    *
FROM `my_table`
    JOIN (
        SELECT
            @rank:=@rank+1 AS order_number,
            item_id
        FROM `my_table`
    ) as `count_table`
    ON (`count_table`.item_id = `my_table`.item_id);
