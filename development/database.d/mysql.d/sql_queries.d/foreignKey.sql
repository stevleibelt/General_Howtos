-- 
-- create table my_table
-- my_table and other_table must have the same charset and the same engine
-- the both keys must have the same data type as well as the same collation (if defined)
-- 
-- http://www.1keydata.com/sql/sql-foreign-key.html
-- http://cristian-radulescu.ro/article/disable-foreign-key-checks-in-mysql.html
-- 

CREATE TABLE my_table (
  `id` INT NOT NULL,
  `other_table_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`other_table_id`) REFERENCES `other_table` (`id`)
) ENGINE=InnoDb;

-- 
-- name the foreign key
-- http://stackoverflow.com/questions/10028214/add-foreign-key-to-existing-table
-- 

ADD CONSTRAINT `my_foreign_key_name` FOREIGN KEY (`my_table_id`) REFERENCES `other_table`(`id`);

-- 
-- disable foreign key check
-- 

SET FOREIGN_KEY_CHECKS = 0;

-- 
-- enable foreign key check
-- 

SET FOREIGN_KEY_CHECKS = 1;

-- 
-- show all available foreign keys to one origin table
-- @see: http://stackoverflow.com/questions/201621/how-do-i-see-all-foreign-keys-to-a-table-or-column
-- 

SELECT
    `TABLE_NAME`, 
    `COLUMN_NAME`,
    `CONSTRAINT_NAME`,
    `REFERENCED_TABLE_NAME`,
    `REFERENCED_COLUMN_NAME`
FROM 
    `INFORMATION_SCHEMA`.`KEY_COLUMN_USAGE`
WHERE
    `REFERENCED_TABLE_NAME` = '<your origin table name>';
