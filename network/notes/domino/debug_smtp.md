# how to

## enable debugging

```
#type following in your domino console
#domino is telling you when the settings are used

set config SMTPDebug=3
set config SMTPDebugIO=3
set config SMTPClientDebug=3
set config TraceSSLHandshake=1
set config SMTPSaveOutboundToFile=1
set config SMTPImportErrors=1
set config DEBUGROUTER=3

#to disable debugging mode

set config SMTPDebug=0
set config SMTPDebugIO=0
set config SMTPClientDebug=0
set config TraceSSLHandshake=0
set config SMTPSaveOutboundToFile=0
set config SMTPImportErrors=0
set config DEBUGROUTER=0
```

## where data and logs are stored

* log file with a name like `dcntrlr<date time like number>.log` can be found in `<path>\Lotus\Domino\data`
* smtp message dump can be found in `c:\windows\temp\notes<suffix>\st<number>.TMP`
* how to decode base64? `cat <base64 encoded part> | base64 --decode > <original file name>.<original extension>`

# links

* [Debugging SMTP in Domino](https://dominopeople.ie/debugging-smtp-in-domino/) - 20130319
* [SMTP Service Not Available, Closing Transmission Channel](https://rprwyatt.com/domino-support/smtp/) - 20200125
