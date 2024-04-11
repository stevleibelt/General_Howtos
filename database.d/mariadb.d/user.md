# create a user

```
#login as root
mysql -u root -p

#create account
CREATE USER '<username>'@'localhost' IDENTIFIED BY '<password>';
##you can also create useres for a subnet and restrict to SSL protected transmission
#CREATE USER '<username>'@'172.16.0.0/255.255.0.0' IDENTIFIED BY '<password>' REQUIRE SSL;

#grant privileges
GRANT ALL PRIVILEGES ON *.* TO '<username>'@'localhost';
##list of privileges
#GRANT, SUPER, PROCESS, RELOAD, SHUTDOWN, SHOW DATABASES, LOCK TABLES, REFERENCES, REPLICATION CLIENT, REPLICATION SLAVE, CREATE USER

#reload privileges
FLUSH PRIVILEGES;

#exit
\q
```

# create a superuser

```
#login as root
mysql -u root -p

#create account
CREATE USER 'superuser'@'%' IDENTIFIED BY '<password>';

#grant privileges
GRANT ALL PRIVILEGES ON *.* TO 'superuser'@'%' WITH GRAND OPTION;

#reload privileges
FLUSH PRIVILEGES;

#exit
\q

#login as superuser
mysql -u superuser -p

#check privileges
SHOW GRANTS FOR 'superuser';
```

# link

* [How to create MySQL admin user (superuser) account](https://www.cyberciti.biz/faq/how-to-create-mysql-admin-user-superuser-account/)
