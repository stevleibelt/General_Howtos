# OS Pro Telemetry edition on Opnsense

## HowTo

* `Firmware` -> `Plugins` -> `os-etpro-telemetry`
  * `+`
* `Services` -> `Intrusion Detection` -> `Administration`
  * `Download`
  * Select your preferrend Rules
  * `Enable selected`
  * Set token
  * `Save`
  * `Download & Update Rules`
* `Lobby` -> `Dashboard`
  * `Add widget`
  * ` Telemetry status`
  * `Apply`
* `System` -> `Settings` -> `Cron`
  * `+`
  * Command: `Update and reload intrusion detection rules`
  * Description: `Automatic update of intrusion detection rules`
  * `Apply`

## Links

* [Official documentation](https://docs.opnsense.org/manual/etpro_telemetry.html) - 20230214
* [Proofpoint shop page](https://shop.opnsense.com/etpro-telemetry-faq/) - 20230214

