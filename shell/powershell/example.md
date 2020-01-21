# update ad user properties from an csv file

```
#given is that the csv file contains two columns, account and mail
$users=Import-Csv c:\path\to\the.csv -Encoding UTF-8

foreach ($user in $users) {
    Set-AdUser -Identity $user.account -EmailAddress $user.mail
}
```
