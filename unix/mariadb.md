# general

## setup

on arch linux, start deamon and run "msql_secure_installation"

## start/stop

    systemctl [restart|start|stop] mysqld.service

## login as root

    mysql -p -u root

## enable auto-completion

* edit '/etc/mysql/my.cnf'
* replace 'no-auto-rehash' with 'auto-rehash'

## check and repair all tables

    mysqlcheck -A --auto-repair -u root -p

## optimize all tables

    mysqlcheck -A --auto-repair -f -o -u root -p

## grant remote access

* edit '/etc/mysql/my.cnf'
* uncomment '#skip-networking'
* uncomment '#bind-address = ' and add your ip address
* >mysql: GRANT ALL PRIVILEGES ON *.* TO 'root'@'<your-subnet>%' IDENTIFIED BY '<your remote password>' WITH GRANT OPTION;

# links

* https://wiki.archlinux.org/index.php/MySQL
