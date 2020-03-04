# Fix 0x8024401c

* WIN+R
* `regedit` and press OK
* Go to `HKEY_LOCAL_MACHINE` > `Software` > `Policies` > `Microsoft` > `Windows` > `WindowsUpdate` -> `AU`
* Change value of `UseWUServer` from whatever to `0`
* [source](https://www.drivereasy.com/knowledge/windows-update-error-0x8024401c-fixed/) - 2020-03-04
