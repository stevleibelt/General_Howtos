-- 
-- @see
--  https://www.postgresql.org/docs/current/sql-insert.html
--  https://www.postgresql.org/docs/current/tutorial-transactions.html
-- 

-- 
-- Copy rows but changing value of one column
-- 
BEGIN;

INSERT INTO
  public.my_table (column_one, column_two)
SELECT
  column_one, 'FOO'
FROM
  public.my_table
WHERE
  column_two = 'BAR';

COMMIT;

