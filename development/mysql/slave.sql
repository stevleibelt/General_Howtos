-- 
-- get slave status
-- must be executed on all slaves
-- 
-- @see
--  https://dev.mysql.com/doc/refman/5.1/en/replication-administration-status.html
-- 

SHOW SLAVE STATUS;

-- or more verbose

SHOW SLAVE STATUS\G;

-- 
-- start a slave
-- @see
--  https://www.digitalocean.com/community/tutorials/how-to-set-up-master-slave-replication-in-mysql
-- 

START SLAVE;
