-- 
-- delete table
-- 
DROP TABLE [IF EXISTS] `my_table`

-- 
-- delete database
-- 
DROP DATABASE [IF EXISTS] `my_database`

-- 
-- delete user if "delete" is not working
-- @see
--  https://www.percona.com/blog/when-manipulating-mysql-user-tables-goes-wrong-troubleshooting-error-1396/ - 20221006T07:37:20
-- 
DROP USER [IF EXISTS] `my_user`

