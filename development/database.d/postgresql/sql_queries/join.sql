-- 
-- @see
--  https://www.neilwithdata.com/join-using
-- 

-- 
-- All about joining
-- 

-- 
-- Assuming two tables have the same column names
--  first_table has the columns foo, bar, baz
--  second_table has the columns foo, bar, foz
-- 

-- You don't have to reference duplicated columns that are used
--  Inside the USING part
SELECT foo, bar, first_table.baz, second_table.foz
FROM public.first_table
  JOIN public.second_table
    USING (foo, bar)
    -- is the same as
    -- ON (
    --  first_table.foo = second_table.foo
    --  AND first_table.bar = second_table.bar
    -- )

