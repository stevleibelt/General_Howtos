# Browse LDAP directory

You can use `ldapsearch`, `JXplorer` or `Apachedirectorystudio`.

```
ldapsearch -x '(objectClass=*)' -b 'c=DE' -D "<user name>" -W -h <host ip>
```

# Restart ldap service on the domino

```
restart task ldap
```

# Links

* [The LDAP Service - 10.0.1](https://help.hcltechsw.com/domino/10.0.1/conf_theldapservice_c.html) - 20210601
