-- 
-- create my_table
-- https://dev.mysql.com/doc/refman/5.1/en/create-table.html
-- 

CREATE TABLE `my_table` [IF NOT EXISTS]
(
  `id` INT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `createdAt` (`created_at`)
) Engine=InnoDB DEFAULT CHARSET=utf8 COMMENT='my short comment';
