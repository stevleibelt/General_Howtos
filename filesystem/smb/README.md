# SMB

## Help

### User [] from [] failed to log in via [SMB] doe to [NTLMv1 not permitted]

So I had the joy to discover this issue under the following circumstances.

* A Windows XP client still exists and want to access an smb share
* The smb share is offered by an synology nas where the system was upgraded to DSM 7.0.1

I went to `Systemsteuerung` -> `Dateidienste` -> `SMB` -> `Protokolle anzeigen` and selected `Allgemein` to find the error message mentioned above.

With that information, it was easy to ask the web and find a working solution.

* Login on the Windows XP machine
* `Start` -> `run`
* Enter `secpol.msc`
* `Security Settings` -> `Local Policies` -> `Security Options` -> `Network security: LAN Manager authentication level`
* Select last option `Send NTLMv2 response only\refuse LM & NTLM`
* Click on `OK`
* Latest after a restart, your smb connection should work again

Reminder, remove this Windows XP machines and try to upgrade to SMBv3 as soon as possible.

