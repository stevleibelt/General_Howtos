# Installation

```
wget https://repo.zabbix.com/zabbix/5.0/debian/pool/main/z/zabbix-release/zabbix-release_5.0-1+buster_all.deb
dpkg -i zabbix-release_5.0-1+buster_all.deb
apt update 

apt install zabbix-server-pgsql zabbix-frontend-php php7.3-pgsql zabbix-apache-conf zabbix-agent 

sudo -u postgres createuser --pwprompt zabbix
sudo -u postgres createdb -O zabbix zabbix 

zcat /usr/share/doc/zabbix-server-pgsql*/create.sql.gz | sudo -u zabbix psql zabbix 

vim /etc/zabbix/zabbix_server.conf 
DBPassword=password

vim /etc/zabbix/apache.conf
php_value date.timezone Europe/Berlin

systemctl restart zabbix-server zabbix-agent apache2
systemctl enable zabbix-server zabbix-agent apache2 

#open http://server_ip_or_name/zabbix
#continue with: https://www.zabbix.com/documentation/current/manual/installation/install#installing_frontend
```


