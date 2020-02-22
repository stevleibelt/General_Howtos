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

* [System- und Applicationsmonitoring](https://media.ccc.de/v/GLT18_-_385_-_de_-_g_ap147_005_-_201804281350_-_system-_und_applikationsmonitoring_-_martin_maurer_-_robert_van_der_stel)
* [nems linux](https://nemslinux.com/) - 2020-02-22
