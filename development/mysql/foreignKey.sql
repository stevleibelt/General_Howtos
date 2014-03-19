-- create table my_table
-- my_table and other_table must have the same charset and the same engine
-- the both keys must have the same data type as well as the same collation (if defined)
-- 
-- http://www.1keydata.com/sql/sql-foreign-key.html
-- http://cristian-radulescu.ro/article/disable-foreign-key-checks-in-mysql.html

CREATE TABLE my_table (
  `id` INT NOT NULL,
  `other_table_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`other_table_id`) REFERENCES `other_table` (`id`)
) ENGINE=InnoDb;

-- disable foreign key check

SET FOREIGN_KEY_CHECKS = 0;

-- enable foreign key check

SET FOREIGN_KEY_CHECKS = 1;
