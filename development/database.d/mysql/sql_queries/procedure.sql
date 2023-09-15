-- 
-- @see
--  https://dev.mysql.com/doc/refman/5.0/en/create-procedure.html
--  http://forums.mysql.com/read.php?98,358569,358569
-- 

DELIMITER // 
CREATE PROCEDURE get_all_users() 
BEGIN 
    SELECT * FROM `user`; 
END // 
DELIMITER ; 
