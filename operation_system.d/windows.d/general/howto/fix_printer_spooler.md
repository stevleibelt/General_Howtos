# Fix printer spooler issue

```
; @see: https://pureinfotech.com/fix-printer-spooler-windows-10/
; @since: 2020-07-17
net stop spooler
del /Q /F /S "%systemroot%\System32\Spool\Printers\*.*"
net start spoole
```
