# why monitor and log?

* to fetch metrics and compare them with others (gain knowledge about speed, performance)
* meassure
    * high availability
    * number of errors
        * you should know about responding >= 400 errors (even javascript errors)
    * performance
    * how much money do we earn / how much does it cost
        * when do I earn much (per day, per week etc.) to plan updates
* best meassure per service (login service, user service, payment service etc.)

# types of monitoring

* red green monitoring
    * shows if a service is working or not
* application performance monitoring
    * how fast is taking a call, request, database communication
    * coasts performance on production
* business transaction monitoring
    * orders per hour, total, with errors
* network monitoring
    * how speedy is the network (check with tokens)
* system monitoring
    * number of services, status (warning, critical), cpu load, memory load, disk load etc.
* website monitoring
    * how fast are pages delivered (search, category, product, checkout, lobby etc.)
    * requests per seconds

# typical core components

* collector - collects metrics from host/systems
* storage - time series database for storing real-time/high volume metrics
* gui - query and visualization interfaces sometimes including alert management

# tools

* watch logfiles wiht less and tail, awk, grep and sed by using a reverse proxy
* monitoring
    * nagios
    * icinga
    * check_mk
* logging server
    * rsyslog / collectd / greylog
    * influxdb / telegraf / chronograf / kapacitor
    * elastic stack / beats / logstash / elastic search / kibana
    * grafana

# link

* [collectd](https://collectd.org/) - collects system and application performance metrics periodically and provides mechanisms to store the values in a variety of ways - 20201022
    * [snmp plugin](https://collectd.org/wiki/index.php/Plugin:SNMP) - 20201022
* [datadog agent](https://github.com/DataDog/datadog-agent) - 20201022
* [grafana](https://grafana.com/) - compose observability dashboards - 20201022
    * [plugins](https://grafana.com/grafana/plugins) - 20201022
* [graphite](https://graphiteapp.org/) - enterprise-ready monitoring tool - 20201022
* [kapacitor](https://www.influxdata.com/time-series-platform/kapacitor/) - real-time streaming data processing engine - 20201022
* [loki](https://grafana.com/oss/loki/?plcmt=footer) - horizontally-scalable, highly-available, multi-tenant log aggregation system - 20201022
* [metricbeat](https://github.com/elastic/beats/tree/master/metricbeat) - fetches a set of metrics on a predefined interval from the operating system and services and ships them - 20201022
* [munin](http://munin-monitoring.org/] - networked resource monitoring tool - 20201022
* [prometheus](https://prometheus.io/) - open-source systems monitoring and alerting toolkit - 20201022
* [telegraf](https://www.influxdata.com/time-series-platform/telegraf/) - open source server agent to help you collect metrics from your stacks, sensors and systems - 20201022
    * [Build a Homelab Dashboard: Part 10 – SNMP and Telegraf](https://www.homelabrat.com/snmp-and-telegraf/) - 20180926
    * [How to Monitor Your SNMP Devices with Telegraf](https://www.influxdata.com/blog/monitor-your-snmp-devices-with-telegraf/) - 20200114
    * [Install an SNMP Agent and Configure Telegraf SNMP Input](https://sbcode.net/grafana/install-snmpd-config-telegraf/) - 20201022
    * [Monitoring Windows Services with Grafana, InfluxDB and Telegraf](https://thenewstack.io/monitoring-windows-services-with-grafana-influxdb-%E2%80%8Eand-telegraf/) - 20201022
    * [Using Telegraf, InfluxDB and Grafana to Monitor Network Statistics](https://lkhill.com/telegraf-influx-grafana-network-stats/) - 20201022
* [zabbix](https://www.zabbix.com/) - full-featured monitoring solution for larger networks - 20201022
    * [zabbix agent](https://www.zabbix.com/download_agents)

* [System- und Applicationsmonitoring](https://media.ccc.de/v/GLT18_-_385_-_de_-_g_ap147_005_-_201804281350_-_system-_und_applikationsmonitoring_-_martin_maurer_-_robert_van_der_stel)
* [nems linux](https://nemslinux.com/) - 20200222
