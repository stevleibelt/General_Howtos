-- add column with index

ALTER TABLE 
    `my_table`
ADD 
    `my_column` TINYINT( 1 ) NOT NULL DEFAULT 0,
ADD 
    INDEX `my_column` (`my_column`),
ADD 
    INDEX `my_other_column` (`my_other_column`);

-- delete column with index

ALTER TABLE 
    `my_table` 
DROP 
    `my_column`,
DROP 
    INDEX `my_column`,
DROP
    INDEX `my_other_column`;

-- add index

ALTER TABLE 
    `my_table` 
ADD 
    INDEX `my_column` (`my_column`);

-- add index on BLOB/TEXT
-- mySQL: ERROR 1170 (42000): BLOB/TEXT column ‘XXX’ used in key specification without a key length

ALTER TABLE 
    `my_table`
ADD
    INDEX `my_column` (`my_column`(10000)); -- length of the index, to find the longest string, use: SELECT MAX(LENGTH(field_to_query)) FROM table_to_query: SELECT MAX(LENGTH(`my_column`)) FROM `my_table`;

-- change engine
-- http://dev.mysql.com/doc/refman/5.0/en/converting-tables-to-innodb.html
-- http://dev.mysql.com/doc/refman/5.6/en/innodb-storage-engine.html
-- http://dev.mysql.com/doc/refman/5.6/en/storage-engines.html

ALTER TABLE
    `my_table`
ENGINE=InnoDB;  -- InnoDB, MyISAM, ARCHIVE, MEMORY ...

-- rename table

RENAME TABLE `my_old_table_name` TO `my_new_table_name`;

-- rename table column
-- @see: http://dev.mysql.com/doc/refman/5.1/en/alter-table.html

ALTER TABLE 
    `my_table` 
CHANGE 
    `my_old_column_name` `my_new_column_name` <DATATYPE(<LENGTH>)> [<additonal column specifications>] [<constrains>];

-- reset or alter autoincrement value

ALTER TABLE 
    `my_table`
AUTO_INCREMENT = 1;
