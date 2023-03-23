# Grafana

A help file exists [here](HELP.md)

## Api

### Get user id per email address

```bash
GET: http://localhost/api/users/lookup?loginOrEmail=foo@bar.ru
```

### Set new user password as admin

```bash
PUT: http://localhost/api/admin/users/:id/password
Content-Type: application/json
BODY: {"password":"new-password"}
```

## /etc/grafana.ini


```bash
#use redis as data cache
[remote_cache]
type = redis
connstr = addr=127.0.0.1:6379,pool_size=1000,db=1,ssl=false
```

## Link

* [admin - password for user.](http://docs.grafana.org/http_api/admin/#password-for-user)
* [Monitoring mit Telegraf, InfluxDB und Grafana](https://www.bachmann-lan.de/monitoring-mit-telegraf-influxdb-und-grafana/)

