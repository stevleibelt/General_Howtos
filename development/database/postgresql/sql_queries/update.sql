-- 
-- @see
--  https://www.postgresql.org/docs/current/sql-update.html
--  https://www.postgresql.org/docs/current/tutorial-transactions.html
-- 

BEGIN;

UPDATE my_table
SET column_one = 'there is no foo without a bar'
FROM mo_table  -- FROM is optional, see it as the first join
  JOIN mi_table  -- Of course you can join gazillion tables
    ON mi_table_column_one = mo_table.column_one
WHERE
  my_table.column_two = mo_table.column_two -- Since from is the first join, this is the fitting on-join-condition
  AND mi_table_column_two = 'rewind selecta!';

COMMIT;

