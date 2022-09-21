-- 
-- @see
--  https://www.postgresqltutorial.com/postgresql-administration/postgresql-describe-table/
-- 

-- Right now, it looks like postgres has nothing similar like MySQL/MariaDB
-- In psql, you can use `\d`
SELECT table_name, column_name, data_type
FROM information_schema.columns
WHERE table_name = '<string: table name>' ORDER BY column_name ASC;

