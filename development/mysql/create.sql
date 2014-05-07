-- 
-- create my_table
-- https://dev.mysql.com/doc/refman/5.1/en/create-table.html
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

-- uncomment foreign key checks if needed
-- SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE `copy_of_original_table`
SELECT * FROM `original_table`;
-- SET FOREIGN_KEY_CHECKS = 1;
