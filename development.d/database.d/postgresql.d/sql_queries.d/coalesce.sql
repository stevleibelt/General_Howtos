-- 
-- @see
--  https://www.postgresql.org/docs/14/functions-conditional.html#FUNCTIONS-COALESCE-NVL-IFNULL
-- 
-- @tags/search patterns
--  String is empty | empty string
-- 

-- 
-- I've used it for the case where I need to join two tables and the content of a column
--  was allowed to be '$value', '' or NULL
-- Furthermore it is used to output/display null values as human readable '(none)' or 'NO DATA'

-- Compare two columns that could contain '' or NULL
--  If a column value either is '' or NULL, it should be be handled as equal
-- 

SELECT
    foo.baz,
    bar.baz
FROM
    public.foo
    INNER JOIN public.bar
    ON (
        -- CAUTION, baz could contain a value, '' or NULL
        --  '' and NULL are seen as empty
        COALESCE(foo.baz, '') = COALESCE(bar.baz, '')
    )
;

-- 
-- Check if column value is not empty
-- 

-- By using TRIM
--  TRIM should be used if you deal with a string that can contain only spaces
SELECT foo.bar
FROM public.foo 
WHERE TRIM(foo.bar) != '';

-- By using COALESCE
SELECT foo.bar
FROM public.foo 
WHERE COALESCE(foo.bar, '') != '';


