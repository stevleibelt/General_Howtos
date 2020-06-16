# How to

## Courser (in Office/Excel/Word) is not blinking

```
#execute this on the terminal server
#see REG ADD /? for more information
#/f = Forces an overwrite if exists
#/v = Value Name
#/t = Type
#/d = Data
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /f /v CursorBlinkEnable /t REG_SZ /d 1
```
