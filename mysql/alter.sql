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
