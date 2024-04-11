# Try to connect to a mssql server from a freebsd host

Following notes are done by using a freebsd 13.2 host.

* `pkg install freetsd`
* Fetch information about mssql server `tsql -L -H <string: mssql_hostname_or_ip_address>`
* Try raw connection by using `tsql -H <string: mssql_hostname_or_ip_address> -p 1433 -U <string: username> -P <string: password> -D <string: databasename>`
  * **Note** this is using the global section of the freetds.conf
* Adapt file `/usr/local/etc/freetds/freetds.conf` and add the following lines

```bash
[mymssql]
    host = mssql.host.local
    port: 1433
    tds version = 7.0
    #tds version = 7.4
    client charset=UTF-8
```

* Execute a simple test by doing `tsql -S mymssql`
  * `tsql -S mymssql -U "<string: username>" -P "<string: password>" -D <string: database_name>`

# Error solving

* Enable debugging with `export TDSDUMP=/tmp/freetds.log`
  * Retry with `tsql -H #...`
  * And use `tail -f /tmp/freetds.log` with another shell
* Search for all available tds librarys: `find / -name 'libtds*'`
* Check output of `odbcinst -j`
* Check output of `tsql -C`
* Change `tds version` in your `freetds.conf`

## Links

* [Chosing a TDS protocol version: freetds.org](https://www.freetds.org/userguide/ChoosingTdsProtocol.html) - 20230906
* [Logging: freetds.org](https://www.freetds.org/userguide/logging.html) - 20230906
* [pymssql FAQ: readthedocs.io](https://pymssql.readthedocs.io/en/stable/faq.html) - 20230906
