# Punycode is

```
Punycode is a representation of Unicode with the limited ASCII character subset used for Internet hostnames.
```

[source](https://en.wikipedia.org/wiki/Punycode) - 20210721

It is used in the DNS world to ease up handling special character domains like "überspace.de".
Domains in punycode are prefixed with `xn-`.

There are multiple [punycode convertes](https://www.punycoder.com/) online available.

Hint! If you need to write an email to a domain with special characters, do only insert the domainname in a punycode converter.
For example `info@überspace.de` would become `info@xn--berspace-55a.de` and not `xn--info@berspace-0ob.de`.
