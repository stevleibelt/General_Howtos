-- create table my_table
-- my_table and other_table must have the same charset and the same engine
-- the both keys must have the same data type as well as the same collation (if defined)
-- 
-- http://www.1keydata.com/sql/sql-foreign-key.html

CREATE TABLE my_table (
  `id` INT NOT NULL,
  `other_table_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`other_table_id`) REFERENCES `other_table` (`id`)
) ENGINE=InnoDb;
