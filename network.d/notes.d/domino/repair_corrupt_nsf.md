# Repair corrupt NSF file

## From the domino console

```
#if the database uses transaction protocol, add `-J`
load fixup mail\database.nsf -L -F
load compact mail\database.nsf -c -i -D
load updall mail\database.nsf -R
```

## From the command prompt

* copy corrupt nsf file to somewhere else on the server (out from the `data` path)
* open a command prompt in your domino path
* execute `nfixup.exe path\to\the\database.nsf -L -F`
    * if there is transaction protocol enabled, add `-J`
* execute `ncompact.exe path\to\the\database.nsf`
* execute `nupdall.exe -r path\to\the\database.nsf`
* copy corrupt nsf file back

# Links

* [Fixes for a Few Lotus Notes Issues](https://keithbalomben.wordpress.com/tag/nfixup-exe/) - 20110601
* [Repair Corrupt NSF File by Using NFIXUP and NCOMPACT Commands](https://www.datarecovery.institute/repair-corrupt-nsf-file/) - 20170721
* [Wartung und/oder Reparatur einer Notes-Datenbank](https://www.itee.de/2016/11/04/wartung-und-oder-reparatur-einer-notes-datenbank/) - 20161104
