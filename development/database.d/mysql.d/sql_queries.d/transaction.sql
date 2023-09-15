# Following operations cannot be rolled back using Mysql.

> http://coders-view.blogspot.de/2012/03/how-to-use-mysql-transactions-with-php.html

* CREATE DATABASE
* ALTER DATABASE
* DROP DATABASE
* CREATE TABLE
* ALTER TABLE
* DROP TABLE
* RENAME TABLE
* TRUNCATE TABLE
* CREATE INDEX
* DROP INDEX
* CREATE EVENT
* DROP EVENT
* CREATE FUNCTION
* DROP FUNCTION
* CREATE PROCEDURE
* DROP PROCEDURE

# Transactions

> http://zetcode.com/databases/mysqltutorial/transactions/
  

START TRANSACTION;
-- your statements
COMMIT;
ROLLBACK;
