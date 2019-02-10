-- not equal
-- both ways are working

SELECT 'foo' <> 'bar';  -- returns 1 (true)
SELECT 'foo' != 'bar';  -- returns 1 (true)

-- comparing case sensitive
-- source: http://www.delphifaq.com/faq/databases/mysql/f801.shtml
SELECT 'A' LIKE 'a';    -- returns 1 (true)

SELECT 'A' LIKE BINARY 'a'; -- returns 0 (false)
