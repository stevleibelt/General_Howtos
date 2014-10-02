# import from file

    mysql -u <user> -p [database] < myfile

# add user and set password

    CREATE USER 'user'@'localhost' IDENTIFIED BY PASSWORD('password');

# get users

    SELECT user FROM mysql.user;

# grant privilege

    GRANT ALL PRIVILEGES ON `my_database`.`mytable` TO 'user'@'localhost' WITH GRANT OPTION;
    GRANT ALL PRIVILEGES ON `my_database`.* TO 'user'@'localhost' WITH GRANT OPTION;
    GRANT ALL ON `my_database`.* TO 'user'@'localhost';

# reload

    flush privileges;

# grant options

    SELECT|USAGE|ALTER|CREATE|INSERT|...

# grant multiple

    GRANT SELECT, INSERT ON 

-- 
-- http://www.ntchosting.com/mysql/create-user.html
-- http://alvinalexander.com/blog/post/mysql/add-user-mysql
-- https://dev.mysql.com/doc/refman/5.1/en/create-user.html
-- http://www.mysqltutorial.org/mysql-create-user.aspx
