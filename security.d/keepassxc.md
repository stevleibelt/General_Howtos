# KeePassXC

The free and open source password manager.

## How to set references

Assuming you have to use one login for multiple services.

You want to use references/linking to ease up the case "change password".

So what to do? Just use the build in references.

* Open the source entry, go to `attributes` and copy the `UUID`
* Go to the entry you want to link to the reference and insert `{REF:U@I:<copied user id>}` in the `user name` field
* Go to the entry you want to link to the reference and insert `{REF:P@I:<copied user id>}` in the `password` field

# Links

* [keepassxc.org](https://keepassxc.org/) - 20220426T14:29:00
