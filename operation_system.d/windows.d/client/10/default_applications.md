# Custom Default Application Associations

This setting has to be done on a per/current user base.

## Using dism

```
#list current settings
dism /online /get-defaultappassociations

#save current settings to file
dism /online /export-defaultappassociations:"<path/to/the/file.xml>"

#reset to factory settings
dism /online /remove-defaultappassociations

#save current settings from file
dism /online /import-defaultappassociations:"<path/to/the/file.xml>"
```

## Example of an xml file

```
<?xml version="1.0" encoding="UTF-8"?>
<DefaultAssociations>
    <Association Identifier=".pdf" ProgId="FirefoxHTML-308046B0AF4A39CB" ApplicationName="Firefox" />
    <Association Identifier=".htm" ProgId="FirefoxHTML-308046B0AF4A39CB" ApplicationName="Firefox" />
    <Association Identifier=".html" ProgId="FirefoxHTML-308046B0AF4A39CB" ApplicationName="Firefox" />
    <Association Identifier=".shtml" ProgId="FirefoxHTML-308046B0AF4A39CB" ApplicationName="Firefox" />
    <Association Identifier=".xht" ProgId="FirefoxHTML-308046B0AF4A39CB" ApplicationName="Firefox" />
    <Association Identifier=".xhtml" ProgId="FirefoxHTML-308046B0AF4A39CB" ApplicationName="Firefox" />
    <Association Identifier="ftp" ProgId="FirefoxURL-308046B0AF4A39CB" ApplicationName="Firefox" />
    <Association Identifier="http" ProgId="FirefoxURL-308046B0AF4A39CB" ApplicationName="Firefox" />
    <Association Identifier="https" ProgId="FirefoxURL-308046B0AF4A39CB" ApplicationName="Firefox" />
    <Association Identifier=".url" ProgId="FirefoxURL-308046B0AF4A39CB" ApplicationName="Firefox" />
</DefaultAssociations>
```

# link

* [Import, export and reset windows custom default application associations](https://www.tenforums.com/tutorials/8744-export-import-default-app-associations-new-users-windows.html) - 2020-05-08
