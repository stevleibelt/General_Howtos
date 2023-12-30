# LDAP

## Filter Syntax

### Requirements of criterias

* Equality: `(attribute=<string: >)`
* Negation: `(!(attribute=<string: >))`
* Presence: `(attribute=*)`
* Absence: `(!(attribute=*))`
* Less than: `(attribute>=<number: >)`
* Greater than: `(attribute<=<number: >)`
* Wildcards/Like: `(attributes=*<string: >*)`

### Combination of criterias

* AND Operation: `(& (<string: criteria) [(<string: criteria) [...]] )`
* OR Operation: `(| (<string: criteria) [(<string: criteria) [...]] )`
* Nested/Complex Operation: `(| (& (<string: criteria_1>) (<string: criteria_2>) (& ( (<string: criteria_3) (<string: criteria_4) )  ) )` means `(criteria_1 AND criteria_2) OR (criteria_3 AND criteria_4)`

### Special characters

| Character | ASCII code |
| --- | --- |
| `(` | `\28` |
| `)` | `\29` |
| `&` | `\26` |
| `|` | `\7c` |
| `=` | `\3d` |
| `>` | `\3e` |
| `<` | `\3c` |
| `~` | `\7e` |
| `*` | `\2a` |
| `/` | `\2f` |
| `\` | `\5c` |

## Link

* [Apache Directory Studio](https://directory.apache.org/studio/) - 20201028
  * [Apache Directory Studio User Guide](https://nightlies.apache.org/directory/studio/2.0.0.v20200411-M15/userguide/Apache_Directory_Studio_LDAP_Browser_User_Guide.pdf) - 20230303
* [Arch Linux Wiki Entry](https://wiki.archlinux.org/title/OpenLDAP) - 20230215
* [JXplorer (Windows Java Ldap Browser)](http://www.jxplorer.org/) - 20200123
* [LDAP Admin (Windows)](http://www.ldapadmin.org/) - 20200123
* [LDAP Filter Syntax](http://www.ldapexplorer.com/en/manual/109010000-ldap-filter-syntax.htm) - 20230216
* [openLDAP.org](https://www.openldap.org/) - 20200123
* [RFC 4514 - LDAP](http://www.faqs.org/rfcs/rfc4515.html) - 20230215
* [Searching the directory with LDAP C SDK](https://wiki.mozilla.org/Mozilla_LDAP_SDK_Programmer%27s_Guide/Searching_the_Directory_With_LDAP_C_SDK) - 20230215
* [What LDAP is not - a brief history of ldap by the python-ldap3 package](https://ldap3.readthedocs.io/en/latest/tutorial_intro.html) - 20230221

