-- 
-- Prepared statements
-- @link: https://dev.mysql.com/doc/refman/5.7/en/sql-syntax-prepared-statements.html
-- 
-- hint: CREATE and ALTER statements cannot be executed with variables.
--  What you can do is building an "on demand" statement by using something like >>CONCAT('ALTER TABLE `, @MY_TABLE_NAME, '`auto_increment=', @MY_NEW_VALUE);
-- 

-- preparing the statement
PREPARE my_statement FROM 'SELECT my_column FROM my_table WHERE id = ?';

-- creating some variables
SET @ID_TO_SEARCH_FOR = (SELECT my_table_id FROM my_other_table LIMIT 1);

-- executing the statement
EXECUTE my_statement USING @ID_TO_SEARCH_FOR;

-- delete prepared statement
DEALLOCATE PREPARE my_statement;
