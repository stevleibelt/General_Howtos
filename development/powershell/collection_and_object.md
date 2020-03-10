# Examples

```
#create collection as array
$myCollection = New-Object System.Collections.ArrayList

#create object
$myObject = New-Object System.Object
#add property to empty object
$myObject | Add-Member -MemberTyp NoteProperty -Name "One Field" -Value "A Value"

#add object to the collection without echoing the index
$myCollection.add($myObject) | Out-Null
```

# Link

* [PowerShell – Create collections of custom objects](https://www.andreasbijl.com/powershell-create-collections-of-custom-objects/) - 2013-11-25
