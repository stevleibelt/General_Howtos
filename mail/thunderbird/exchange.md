# How To Connect Thunderbird To Exchange

First of all, don't expect miracles, microsoft is jelling "fuck you" to all existing standards.
Calendar is something that is working, but only reading. 

## E-Mail

### Connection

```
# ingoint - imap
server name: outlook.office365.com
port: 993
collection security: SSL/TLS
authentication method: normal password

# outgoing
server name: smtp.office365.com
port: 587
collection security: SSL/TLS
authentication method: normal password
```

## Calendar

### Extensions

* [exchange EWS Provider](https://github.com/Ericsson/exchangecalendar)
* [aur link](https://aur.archlinux.org/packages/thunderbird-exchangecalendar/)
* [Exchange 2007/2010 Calendar and Tasks add-on](http://www.1st-setup.nl/wordpress/?page_id=551)

## Links

* [office 365 mail client configuration guide](http://web.ysu.edu/gen/ysu_generated_bin/documents/basic_module/Office_365_Mail_Client_Configuration_Guide_Thunderbird.pdf)
* [sanford guide](https://itservices.stanford.edu/office365pilot/configuration/thunderbird)
* [1st-setup guide](http://www.1st-setup.nl/wordpress/?wp_super_faq=add-a-microsoft-office-365-calendar)
* [useless guide from microsoft](https://support.office.com/en-us/article/Set-up-email-in-Mozilla-Thunderbird-8-0-1ac34fa0-c5be-46f1-9c28-8622d92d766e?ui=en-US&rs=en-US&ad=US)
* [another useless guide from microsoft](https://support.office.com/en-us/article/Email-program-setup-reference-ac2eb7cb-370e-48fd-86be-0d641b7d35c1#__toc331577054)
* [useless answeres.microsoft.com](http://answers.microsoft.com/en-us/outlook_com/forum/oemail-osend/how-to-set-up-thunderbird-to-sync-your-outlookcom/266ddd8f-250c-4e8a-9799-009d992be8e3?tab=question&status=AllReplies#tabs)
* [office 365 thunderbird guide](https://kb.wisc.edu/office365/page.php?id=28427)
