-- 
-- How to change a collation
-- 

-- 
-- No backup, no mercy!
-- mysqldump -u <string: username> -p <string: database_name> > my_backup.sql
--

--
-- Set charset if needed
-- 
ALTER DATABASE <string: database_name> CHARCATER SET = utf8mb COLLAT = utf8mb4_bin;

-- 
-- Create the ALTER TABLE statement for each table that does not have the expected collation
-- 

SELECT CONCAT('ALTER TABLE ', table_name, ' CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;')
FROM information_schema.tables
WHERE table_schema = '<string: database_name>'
  AND table_collation != 'utf8mb4_unicode_ci';

--
-- Do the converting task
--

SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE <string: table_name> CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS=1;
