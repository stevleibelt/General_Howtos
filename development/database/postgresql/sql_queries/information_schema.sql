-- 
-- Find a column with a name like
-- @see: https://dataedo.com/kb/query/postgresql/find-tables-with-specific-column-name
-- @since: 20220701T07:01:20
-- 

SELECT 
    t.table_schema,
    t.table_name,
    c.column_name
FROM
    information_schema.tables t
    INNER JOIN 
        information_schema.columns c
        ON 
            c.table_name = t.table_name
            AND c.table_schema = t.table_schema
WHERE 
    c.column_name LIKE '%<search_pattern>%'
    -- table name is optional
    AND t.table_name = '<table_name>'
    AND t.table_schema NOT INT ('information_schema', 'pg_catalog')
    AND t.table_type = 'BASE TABLE'
ORDER BY
    t.table_schema;

