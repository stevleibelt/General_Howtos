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

-- 
-- create a database and grant access to a new created user
-- @see: http://www.fail2fail.com/archives/52-Create-mysql-database-and-user.html
-- 

SET @LOCAL_DATABASE_NAME='<your database>';
SET @LOCAL_USER_NAME='<your user name>';
SET @LOCAL_USER_PASSWORD='<your user password>';

-- create the database
CREATE DATABASE @LOCAL_DATABASE_NAME;

-- create user
CREATE USER @LOCAL_USER_NAME@'localhost' IDENTIFIED BY @LOCAL_USER_PASSWORD;

-- grant user full rights to the database
GRANT ALL PRIVILEGES ON @LOCAL_DATABASE_NAME.* TO 'user'@'localhost';

FLUSH PRIVILEGES;
