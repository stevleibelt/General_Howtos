# Coding basics

## Best Practices

* use `Option Declare` to stop letting the compiler choose the right type (`Default Values` -> `Domino Designer` -> `LotusScript Editor` -> always insert `Option Declare`)
* use `Option Explicit`
* use the power of oop with all well known oop design patterns
* error logging at list in the following places, keep the logging minimal, maintainable and informative
    * each public routine of a ScribtLibrary
    * on each button-/action-handler of a form or a view
    * each agent initialize
    * each mask events
    * each database script events
* error logging via mail-router in central mailing-db since this logging is asynchronous
* use list instead of array
    * create a list: `Dim myFancyList List As String`
    * add a value: `myFancyList("foo") = "bar"`
    * check: `If IsElement(myFancyList("foo")) Then ...`
    * fetch: `myFancyList("foo")`
* create general validation routine (in an universal scrip library) like the assert from c/c++
    * Log if an error has happened and stop execution
* create simple and own classes with as less dependencies as needed
* separate frontend- and backend code
* keep functions short
* use self speaking function or propertie names like "exportNetherlandsCustomersToCsv"

## Anti-Patterns

* `On Error Resume Next` - you should handle your error on your own
* `Option Public` in script libraries - you should declare all stuff hidden and should select which methods or properties are public
* declare a variable as `variant` instead of real data type
* use `Dim a,b,c As String` and expect that all three variables are from type string (which is not the case, only c is from declared as string, a and b are from type `Variant`)
* handling error per `print` into the server log
* to much comments (each line of comment have to be maintained too)

## Example class

```
' Option Public
Option Declare

' bo module variable declaration
Private session As NotesSession
Private thisDb As NotesDatabase
Private viewForAll as NotesView
' eo module variable declaration

' bo module variable initialisation
Sub Initialize
    Set session = New NotesSession

    Set thisDb = session.CurrentDatabase
    Set viewForAll = thisDb.GetView("LookupAdrByCompany")
End Sub
' eo module variable initialisation

' bo public functions
Public Sub DoSomething(uiDoc as NotesUiDocument)
    ' ...
End Sub
' eo public functions

' bo private functions
Private Function DoSomethingWithThisDocument(document AS NotesDocument)
    ' ...
End Function
' eo private functions
```

# links

* [LotusScript: Anti-Patterns & Best-Practices](https://entwicklercamp.de/konferenz/ent2014.nsf/bc36cf8d512621e0c1256f870073e627/60c08dbd3c75cf5fc1257be200295cba/$FILE/T3S1-Lotusscript.pdf) - 20200703
* [Search result page for "lotus" on ibm.com](https://www.ibm.com/search?lang=en&cc=us&q=lotus&tabType[0]=For%20developers) - 20200702
* [Using the object-oriented features of LotusScript](https://www.ibm.com/developerworks/lotus/library/ls-object_oriented_LotusScript/?S_TACT=105AGX13&S_CMP=EDU) - 20011001
