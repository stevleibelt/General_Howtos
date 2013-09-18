-- some usefull select statements
-- 

-- create md5 based on current unix timestamp
SELECT md5(UNIX_TIMESTAMP());

-- if you need to display text
SELECT IF(`my_column` IS NULL, 'no', 'yes') AS `Status`;
