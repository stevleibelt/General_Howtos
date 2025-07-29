# Evolution Mail

## How To

### Setup Exchange Account

* Install mandatory software
```bash
# Install mandatory packages with your package manager
#   paru is my current package manager
#   enchant and hunspell-* are used to have spell check available
paru -S evolution evolution-aws enchant hunspell-de hunspell-en_us libvoikko hspell aspell-de aspell-en nuspell
```
* Start evolution
* Clickpath: `File` -> `New` -> `E-Mail-Account`
* `Type of Server`: `Exchange Webservice`
  * Validate that `NTLM` is used in section `Legitimation`
* Click on `Get address`
* Finish setup by progressing with individual settings

### Subscribe to another calendar or mailbox

* Start evolution
* Select view `E-Mail`
* Rightclick on your account and select `Subscribe to another users folder ...`
* Click on `Choose`
* Search for account name and select fitting one
* Confirm selection with click on `Ok`
* Select `calender` in section `foldername`
* The new calendar should be viewable in the view `Calendar`

## Links

* [Official Wiki: gnome.org](https://wiki.gnome.org/Apps/Evolution) - 20250613
