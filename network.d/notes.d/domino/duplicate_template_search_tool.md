# Duplicate Template Search Tool

Create it by following click path.

* create new database named `duplicate_template_search.nsf` and use a blank template
* create a new agent in this database using the `Domino Designer` and name it `Duplicate Template Search`
* set the agent runtime type to `Action List Selected` (this will show the agent in the `Actions` menu)
* select `LotusScript` in the `Formular type`-list

## Declaration object of the agent

```
Dim WhatServer As String
Dim dbd As NotesDbDirectory
Dim tmpDb As NotesDatabase
Dim Tdb As NotesDatabase
Dim SelectDBtype As String
Dim CountDb As Long
Dim view As NotesVie
Dim ServerError As String
Dim currentdb As NotesDatabase
Dim item1 As NotesItem
Dim item2 As NotesItem
Dim doc As NotesDocument
Dim DefaultValue As String
Dim CheckTemplateValue As String
Dim AllOk As String
Dim NotesDatabase As NotesDatabase
Dim ServerPath As String
Dim dbtype As Variant
Dim DisplayServer As String
```

## Initialize object of the agent

```
Sub Initialize (This line is shown for reference only)
    Dim profSession As New NotesSession
    Dim session As New NotesSession
askagain:
    WhatServer$ = Inputbox$("Enter Server name - 
    'exit' -to end program - enter nothing for Local"
' Leave blank for Local
    If WhatServer$ = "exit" Then
        Exit Su
    End If

    If WhatServer$ = "" Then
        DisplayServer$ = "Local"
    Else
        DisplayServer$ = WhatServer$
    End If

    AllOK$ = Lcase(Inputbox$("You have selected ---- " &
    DisplayServer$ & " -- Is this Correct? Yes/No"))

    If ALLOK$ = "yes" Then
        ' All Done
    Else
        Goto askagain
    End If

    NextStuff:
    ' The next two lines will get a handle on the Notes data directory
        Set dbd = New NotesDbDirectory(WhatServer$)
    ' Use as a generic counter - how many dbs are processed.
        CountDb = 1
    DBorTemplate:

' The next lines are used to determine if you want to process templates or databases.

    SelectDbtype$ = Lcase(Inputbox$("Select Database or Template"))

    If SelectDbtype$ = "database" Then
        dbType = DATABASE
        Set tmpDb = dbd.GetFirstDatabase(dbtype)
    Elseif SelectDbtype$ = "template" Then
        dbType = TEMPLATE
        Set tmpDb = dbd.GetFirstDatabase(dbtype)
    Else
        Goto DBorTemplate
    End If

' Here's the meat of the code. This gets a handle on each database
'   in the Notes data directory and extracts the template information.

    Do While Not (tmpDb Is Nothing)
        ServerPath$ = tmpDb.FilePath
        Call tmpDb.Open(WhatServer$,ServerPath$)
        ServerPath$ = tmpDb.FilePath
        Set notesDatabase = New NotesDatabase(WhatServer$, ServerPath$)

' The next lines are optional but useful for troubleshooting your code:

        If notesDatabase.IsOpen Then
            Print("Successfully opened " & notesDatabase.Title)
        Else
            Print("Unable to open database")
        End If

        Print ServerPath$

        Set Tdb = session.CurrentDatabase
        Set doc = tdb.CreateDocument

        doc.Subject = "New Template Entry"
        doc.form = "New Template Entry"
        doc.ServerName = WhatServer$
        doc.RepID = tmpDb.ReplicaID
        doc.pathname = ServerPath$
        doc.dbtype = SelectDbtype$
        doc.templatename = tmpDb.DesignTemplateName
        doc.ActualDBtitlke = tmpDb.Title

        CheckTemplateValue$ = tmpDb.DesignTemplateName

' These lines are used as part of the user interface to show
'   which settings are enabled for the inheritance:

        If tmpDb.DesignTemplateName = "" Then
            doc.x = ""
        Else
            doc.x = "x"
        End If

        doc.databaseisatemplate = tmpDb.TemplateName

        If tmpDb.TemplateName = "" Then
            doc.y = ""
        Else
            doc.y = "x"
        End If

        Call doc.Save(True, True)
        Call tmpDb.Close
            nextentry:
        Set tmpDb = dbd.GetNextDatabase

    ' Finally these optional lines are used for troubleshooting and/or counting:

        CountDb = CountDb + 1
        Print CountDb
    Loop

End Sub (This line is show for reference only)
```

## Create a form

Now you have to create form with the following fields in your `duplicate_template_search.nsf` database.

* Subject               - acts as informational field
* ServerName            - name of the server where the data was extracted
* RepID                 - the replica ID of each database found in the search
* pathname              - where the database is in the notes data root path
* dbtype                - template or database
* templatename          - inhericance name of each database found in the search
* databaseisatemplate   - the name of the template
* ActualDBTtle          - title of the database or template name

## Next steps

* data is placed in a document
* you can create views and agents to report the data
