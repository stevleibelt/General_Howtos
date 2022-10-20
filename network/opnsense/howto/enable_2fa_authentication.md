# Enable Two-Factor Authentication for OPNsense

## Create 2FA Server

* Login
* `System` -> `Access` -> `Servers`
* Add new server
* Descriptive name: `TOTP Server`
* Type: `Local + Timebased One Time Passwort`
* Reverse token order: `checked`
* Click on `Save`

## Update user

* Login
* `System` -> `Access` -> `Users`
* Go down to `OTP seed`
* Check `Generate new secret (160 bit)
* Copy the `OTP seed` or click on `Click to unhide` if you want to use the QR Code
* Click on `Save`

## Test all is working

* Login
* `System` -> `Access` -> `Tester`
* Select `TOTP Server`
* Enter username
* In Password, enter password+token (or token+password)

## Enable 2FA

* Login
* `System` -> `Settings` -> `Administration`
* In section `Authentication`, change `Server` from `nothing selected` to `TOTP Server`

