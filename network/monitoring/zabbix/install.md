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

# Optimize MySQL

* If possible, balance the filesystem load to multiple disks
    * `datadir` to specify the default location, that is to dedicate the hard drives to the data directory;
    * `datadir innodb_data_file_path` to define size, and attributes of InnoDB system tablespace data files;
    * `innodb_undo_directory to specify` the path to the InnoDB undo tablespaces;
    * `innodb_log_group_home_dir` to specify the path to the InnoDB redo log files;
    * `log-bin` to enable binary logging and set path/file name prefix (dual functionality); and
    * `tmpdir` (Random, SSD, tmpfs).
* Display current and past configuration
```
SELECT
    t1.*, VARIABLE_VALUE
FROM 
    performance_schema.variables_info t1
    JOIN
        performance_schema.global_variables t2 ON t2.VARIABLE_NAME=t1.VARIABLE_NAME
WHERE
    t1.VARIABLE_SOURCE not like "COMPILED"
```
* Configure `innodb_buffer_pool_size` to 50 Percent of the memory
* If you need more, check the current usage
```


SELECT
    CONCAT(FORMAT(DataPages*100.0/TotalPages,2),' %') BufferPoolDataPercentage
FROM
    (SELECT
        variable_value DataPages 
    FROM 
        information_schema.global_status
    WHERE 
        variable_name = 'Innodb_buffer_pool_pages_data') as A,
    (SELECT
        variable_value TotalPages 
    FROM 
        information_schema.global_status
    WHERE 
        variable_name = 'Innodb_buffer_pool_pages_total') as B;
```
* Configure `log_bin`, `max_binlog_size`, `binlog_expire_logs_seconds` to be able to store at least a few days
* Configure `innodb_log_file_size` to at least 512 mb
    * Check also `innodb_log_file_size` and `innodb_log_files_in_group`
* Since this is monitoring, we could tune for speed in trade over consistency
    * Set `innodb_flush_log_at_trx_commit` to 2
* Configure `table_open_cache`, `max_connections` and `open_files_limit` as well as system `ulimit`
* Configure buffers dependend on the configured `max_connections`
    * `read_buffer_size`
    * `read_rnd_buffer_size`
    * `join_buffer_size`
    * `sort_buffer_size`
    * `binlog_cache_size`
    * `net_buffer_length` 

# Link

* [MySQL performance tuning 101 for Zabbix](https://blog.zabbix.com/mysql-performance-tuning-101-for-zabbix/13899/) - 20210416
