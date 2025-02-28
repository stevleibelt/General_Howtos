# Setup Telekom FTTH/Glasfaser via PPPoE on Opnsense

## HowTo

* `Interfaces` -> `other types` -> `VLAN` (`https://<opnsense ip>/interfaces_vlan.php`)
  * Create new VLAN-Interface:
    * Parent Interface: <wan interface>
    * VLAN-Tag: `7`
    * VLAN Priority: 0
    * Description: `telekom vlan`
* WAN-Interface (`https://<opnsense ip>/interfaces.php?if=wan`):
  * Choose device pppoe
  * IPv4 Configuration: PPPoE
  * PPPoE Configuration:
    * Username|Benutzername: <connection identifier|Anschlusskennung><access number|Zugangsnummer>0001@t-online.de
    * Password|Passwort: <personalized password|Persöhnliches Kennwort>
    * Servicename|Dienstname: `telekom`
* Check:
  * `System` -> `Gateways` (`https://<opnsense ip>/system_gateways.php`)
  * Remove all the gateways not named like `WAN_PPPOE`

