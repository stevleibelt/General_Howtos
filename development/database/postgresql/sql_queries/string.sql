-- 
-- @see
--  https://www.dcodeman.com/string-concatenation-using-pipe-operator-in-postgresql/ - 20220926
-- 

-- BO: Concating strings
-- Deal with possible null values when concating strings
--  We want to create the following string from pieces
--      'There', 'is', 'no', NULL, 'foo', 'without', 'a', 'bar'

-- Using pipes
SELECT 'There' || 'is' || 'no' || NULL || 'foo' || 'without' || 'a' || 'bar';

-- Using concat
SELECT CONCAT('There', 'is', 'no', NULL, 'foo', 'without', 'a', 'bar');

-- Using concat
-- First string is the separator
SELECT CONCAT_WS('-', 'There', 'is', 'no', NULL, 'foo', 'without', 'a', 'bar');
-- EO: Concating strings

-- Trim
SELECT '----' || TRIM(' there is no foo without a bar    ') || '----';

