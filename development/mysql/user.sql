#import from file
mysql -u <user> -p [database] < myfile

#add user
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';

#get users
SELECT user FROM mysql.user;

#grant privilege
GRANT ALL PRIVILEGES ON 'mytable' TO 'user'@'localhost' WIHT GRANT OPTION;

#reload
flush privileges;

#grant options
SELECT|USAGE|ALTER|CREATE|INSERT|...

#grant multiple
GRANT SELECT, INSERT ON 
