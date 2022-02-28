# How upgrade all installed packages

```
cat > /root/upgrade_all_installed_packages.sh <<DELIM
#!/bin/sh
####
# @see https://openwrt.org/docs/guide-user/additional-software/opkg
# @since 2022-02-28
# @author stev leibelt <artodeto.bazzline.net>
####

echo ":: Updating list of available packages."
opkg update
echo ""

echo ":: Upgrading upgradeable packages."
opkg list-upgradable | cut -f 1 -d ' ' | xargs -r opkg upgrade
echo ""

echo ":: Listing from user changed configuration files."
opkg list-changed-conffiles
echo ""
DELIM

chmod +x /root/upgrade_all_installed_packages.sh
```
