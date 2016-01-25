-- 
-- create my_table
-- @see: https://dev.mysql.com/doc/refman/5.1/en/create-table.html
-- 

CREATE TABLE [IF NOT EXISTS] `my_table`
(
  `id` INT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NOT NULL,
  `counter` INT (4) UNSIGNED NOT NULL DEFAULT 0,    -- data_type [NOT NULL | NULL] [DEFAULT default_value]
  PRIMARY KEY (`id`),
  INDEX `createdAt` (`created_at`)
) Engine=InnoDB DEFAULT CHARSET=utf8 COMMENT='my short comment';

-- copy structure

CREATE TABLE `structure_copy_of_original_table` 
LIKE `original_table`;

-- copy structure and data

CREATE TABLE `copy_of_original_table`
SELECT * FROM `original_table`;

-- autoincrement
-- @see: https://dev.mysql.com/doc/refman/5.7/en/example-auto-increment.html
-- "When the column reaches the upper limit of the data type, the next attempt to generate a sequence number fails."
