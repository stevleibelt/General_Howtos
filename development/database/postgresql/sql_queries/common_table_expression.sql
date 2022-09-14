-- 
-- @see
--  https://www.postgresql.org/docs/14/queries-with.html
-- 

-- A CTE/Common table expression can be seen as a temporary table available for this one query
--  It is used to create a dataset used in the real query
-- You don't have to use a table inside the WITH
--  You can also use a kind of "default value set" and filter against it

WITH my_selected_data AS (
    SELECT foo, bar
    FROM baz
    WHERE comment = 'there is no foo without a bar'
)[, other_selected_data AS (...)]
SELECT * 
FROM fozbaz
    JOIN my_selected_data
    ON (
        fozbaz.foo = my_selected_data.foo
        AND fozbaz.bar = my_selected_data.bar
    );

