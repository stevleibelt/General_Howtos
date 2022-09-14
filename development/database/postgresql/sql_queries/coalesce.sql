-- 
-- @see
--  https://www.postgresql.org/docs/14/functions-conditional.html#FUNCTIONS-COALESCE-NVL-IFNULL
-- 

-- I've used it for the case where I need to join two tables and the content of a column
--  was allowed to be '$value', '' or NULL
-- Furthermore it is used to output/display null values as human readable '(none)' or 'NO DATA'

SELECT
    foo.baz,
    bar.baz
FROM
    foo
    INNER JOIN bar
    ON (
        -- CAUTION, baz could contain a value, '' or NULL
        --  '' and NULL are seen as empty
        COALESCE(foo.baz, '') = COALESCE(bar.baz, '')
    )
;

