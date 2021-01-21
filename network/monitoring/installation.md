# Install on debian

## opennms

```
#@see: https://docs.opennms.org/opennms/releases/latest/guide-install/guide-install.html#_installing_on_debian
cat << EOF | sudo tee /etc/apt/sources.list.d/opennms.list
deb https://debian.opennms.org stable main
deb-src https://debian.opennms.org stable main
EOF
wget -O - https://debian.opennms.org/OPENNMS-GPG-KEY | apt-key add -
apt update
apt -y install opennms

systemctl start postgresql

su - postgres
createuser -P opennms
createdb -O opennms opennms

psql -c "ALTER USER postgres WITH PASSWORD 'YOUR-POSTGRES-PASSWORD';"
exit

vi ${OPENNMS_HOME}/etc/opennms-datasources.xml
#replace: YOUR-OPENNMS-USERNAME
#replace: YOUR-OPENNMS-PASSWORD
#replace: YOUR-POSTGRES-PASSWORD

${OPENNMS_HOME}/bin/runjava -s
${OPENNMS_HOME}/bin/install -dis
systemctl enable opennms
systemctl start opennms
#open: http://<ip-or-fqdn-of-your-server>:8980/opennms
#login as: admin/admin
#navigate to: admin -> Change Password -> Change Password
```

## icinga


```
apt-get update
apt-get -y install apt-transport-https wget gnupg
#@see: https://icinga.com/docs/icinga2/latest/doc/02-installation/
#@see: https://packages.icinga.com/debian/
cat << EOF | sudo tee /etc/apt/sources.list.d/opennms.list
deb http://packages.icinga.com/debian icinga-buster main
deb-src http://packages.icinga.com/debian icinga-buster main
EOF
wget -O - https://packages.icinga.com/icinga.key | apt-key add -
apt-get update
apt-get -y install icinga2
apt-get -y install monitoring-plugins

systemctl enable icinga2
systemctl start icinga2

#manual configuration if needed
#icinga2 daemon -c

#install database
apt-get install postgresql
apt-get install icinga2-ido-pgsql
cd /tmp
sudo -u postgres psql -c "CREATE ROLE icinga WITH LOGIN PASSWORD 'icinga'"
sudo -u postgres createdb -O icinga -E UTF8 icinga
vim /etc/postgresql/*/main/pg_hba.conf
#add following
DELIM
# icinga
local   icinga      icinga                            md5
host    icinga      icinga      127.0.0.1/32          md5
host    icinga      icinga      ::1/128               md5
DELIM

systemctl restart postgresql

export PGPASSWORD=icinga
psql -U icinga -d icinga < /usr/share/icinga2-ido-pgsql/schema/pgsql.sql

icinga2 feature enable ido-pgsql
systemctl restart icinga2

#webserver
apt-get install apache2

icinga2 api setup

vim /etc/icinga2/conf.d/api-users.conf

object ApiUser "icingaweb2" {
  password = "Wijsn8Z9eRs5E25d"
    permissions = [ "status/query", "actions/*", "objects/modify/*", "objects/query/*"  ]
    
}

systemctl restart icinga2
```

# Links

* [netdata](https://www.netdata.cloud/) - Distributed system for real-time performance and healt monitoring
