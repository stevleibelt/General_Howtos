-- 
-- @author stev leibelt <artodeto@bazzline.net>
-- @since 2014-08-12
-- 
-- @see
--  https://dev.mysql.com/doc/refman/5.1/en/regexp.html
--  http://www.tech-recipes.com/rx/484/use-regular-expressions-in-mysql-select-statements/
-- 

-- 
-- list of regular expression metacharacters
-- 
-- .            match one character
-- ?            match zero or one character
-- +            match one or more
-- {n}          match n-times
-- {m,n}        match m- up to n-times
-- {n,}         match at least n-times
-- ^            match begin of content
-- $            match end of content
-- [[:<:]]      match begin of words
-- [[:>:]]      match end of words
-- [[:class:]]  match character class ([:alpha:], [:digit:], [:space:], [:punct:], [:upper:], [:lower:] etc.)
-- [abc]        match a, b or c
-- [^abc]       match any character NOT a, b or c
-- |            separate alternatives
-- 

-- 
-- simple example
-- 

SELECT * 
FROM `my_table` 
WHERE `my_column` REGEXP 'regexp';

-- 
-- select all columns starting with 'foo'
-- 

SELECT * 
FROM `my_table` 
WHERE `my_column` REGEXP '^foo';

-- 
-- select all columns containing the word 'foo'
-- 

SELECT * 
FROM `my_table` 
WHERE `my_column` REGEXP '[[:<:]]foo[[:>:]]';

-- 
-- simulate a "string LIKE IN()"
-- @see
--  http://stackoverflow.com/questions/1127088/mysql-like-in
--  https://dev.mysql.com/doc/refman/5.0/en/pattern-matching.html
-- 

SELECT * 
FROM `my_table` 
WHERE `my_column` REGEXP 'foo|bar|foobar';

-- 
-- search for things ending with at least one tab
-- 

SELECT *
FROM `my_table`
WHERE `my_column` REGEXP '^.*\t$'

-- 
-- search for characters that are not included in the string
-- @see
--  https://dev.mysql.com/doc/refman/5.5/en/regexp.html#operator_not-regexp
-- 

SELECT 
    `my_column`
FROM 
    `my_table`
WHERE 
    -- REGEXP to get all local parts where the characters inside the [] are NOT 
    `my_column` REGEXP '[^a-zA-Z0-9\\#\\}\\|\\{\\*\\~\\=\\/\\^\\!\\&\\?\'\\+\\._-]';
