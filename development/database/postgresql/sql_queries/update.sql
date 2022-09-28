-- 
-- @see
--  https://www.postgresql.org/docs/current/sql-update.html
-- 

UPDATE public.my_table
SET public.my_table.column_one = 'there is no foo without a bar'
FROM other_schema.mo_table  -- FROM is optional, see it as the first join
  JOIN another_one.mi_table  -- Of course you can join gazillion tables
    ON another_one.mi_table_column_one = other_schema.mo_table.column_one
WHERE
  public.my_table.column_two = other_schema.mo_table.column_two -- Since from is the first join, this is the fitting on-join-condition
  AND another_one.mi_table_column_two = 'rewind selecta!';

