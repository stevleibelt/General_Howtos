# PowerShell Examples

# Update ad user properties from an csv file

```pwsh
#given is that the csv file contains two columns, account and mail
//add -Delimiter if the csv file is separated by ";"
//add -Header column_name_one,column_name_two if your csv file has no header row
//example how to filter for entries that have a column "organisation" with the content "bazzline"
//  Import-Csv file.csv | where-object {$_.organisation -eq "bazzline"}
$users=Import-Csv c:\path\to\the.csv -Encoding UTF-8

foreach ($user in $users) {
    Set-AdUser -Identity $user.account -EmailAddress $user.mail
}
```
# Generate a csv from a data set

```pwsh
$employees = @(
    [pscustomobject]@{
        FirstName = 'Adam'
        LastName = 'Beyer'
        Department = 'Master Of Sound'
    }
    [pscustomobject]@{
        FirstName = 'Anthony'
        LastName = 'Rother'
        Department = 'Voice Of The Machines'
    }
)

//add -Append if you want to append to an existing file
//add -NoTypeInformation if you don't want to have the headline
$employees | Export-Csv -Path C:\employees.csv
```
