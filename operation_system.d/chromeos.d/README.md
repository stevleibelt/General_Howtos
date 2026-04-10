# ChromeOS

## How To's

* ChromeOS Developer Shell is available on the chrome browser via the uri `chrome-untrusted://crosh`.
* Enter development mode (caution, you will lose all data on the device):
  * Power on the device
  * Press and hold the `Esc` and `Refresh` keys
  * Press the `Power Button` while you are on the sign-in/home screen
  * You've reached the development mode when can read `Let's step you through the recovery process`
  * Press and hold the `CTRL` and `D` keys
  * When you see `You are attempting to enable developer mode`, press the `Arrow Up` key and select `Confirm`
  * Press and hold the `CTRL` and `D` keys
  * Press and hold the `CTRL` and `D` keys
* Sideload an APK:
  * Open ChromeOS Settings
  * Scroll down until you see `About ChromeOS`
  * Scroll down to the `Developers` section
  * Search for `Linux development environment` and click on `Set up`
  * Open ChromeOS Settings
  * Search for `Develop android Apps`
  * Search for `Enable ADB debugging` and click on `On`
  * Select `Restart and Continue` and click on `Confirm`
  * Restart your device
  * Search for `Terminal` in your application launcher
  * Select `Penguin`
  * Write `sudo apt install adb` and confirm with `Y`
  * Write `adb connect arc` and confirm with `Enter`
  * Install an downloaded apk with `adb -s emulator-5554 install "<string: my_file>.apk"`

## Links

* [Custom coreboot firmware: mrchromebox.tech](https://docs.mrchromebox.tech/) - 20260410
* [ChromeOS Developer Shell: chromium.org](https://www.chromium.org/chromium-os/chromiumos-design-docs/developer-shell-access/) - 20260410
* [How to Sideload Android Apps on Chromebook without Developer Mode: beebom.com](https://beebom.com/how-sideload-android-apps-chromebook/) - 20260410
