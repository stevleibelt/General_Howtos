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

echo ":: Checking if configuration files where changed."

PATH_TO_THE_CACHE="/root/.cache/net_bazzline"
PATH_TO_THE_TEMP_FILE=\$(mktemp)

PATH_TO_THE_CACHED_FILE="\${PATH_TO_THE_CACHE}/list_of_changed_configuration_files.txt"

if [ ! -d "\${PATH_TO_THE_CACHE}" ];
then
    mkdir -p "\${PATH_TO_THE_CACHE}"
fi

if [ -f "\${PATH_TO_THE_CACHED_FILE}" ];
then
    opkg list-changed-conffiles > "\${PATH_TO_THE_TEMP_FILE}"
    
    NUMBER_OF_LINES_FROM_DIFF=\$(diff "\${PATH_TO_THE_CACHED_FILE}" "\${PATH_TO_THE_TEMP_FILE}" | wc -l)

    if [ \${NUMBER_OF_LINES_FROM_DIFF} -gt 0 ];
    then
        echo "   Changes in the manual changed configuration files detected."
        echo "   Outputting result off >>diff \"\${PATH_TO_THE_CACHED_FILE}\" \"\${PATH_TO_THE_TEMP_FILE}\"<<"
        echo "   ---- Start ----"
        diff "\${PATH_TO_THE_CACHED_FILE}" "\${PATH_TO_THE_TEMP_FILE}"
        echo "   ---- end ----"
        echo ""
        read -p ":: Is this expected? Should I overwrite the existing cached file? (Y/n)" YES_OR_NO

        #@see: https://unix.stackexchange.com/a/132481
        if echo \${YES_OR_NO} | grep -iqF y;
        then
            cp "\${PATH_TO_THE_TEMP_FILE}" "\${PATH_TO_THE_CACHED_FILE}"
        fi
    else
        echo "   No changes detected."
    fi
else
    echo "   File not found >>$\{PATH_TO_THE_CACHED_FILE}<<"
    echo "   All is fine, if this script is executed the first time."

    opkg list-changed-conffiles > "\${PATH_TO_THE_CACHED_FILE}"
    echo "   File >>\${PATH_TO_THE_CACHED_FILE}<< created."
fi

rm "\${PATH_TO_THE_TEMP_FILE}"
echo ""
DELIM

chmod +x /root/upgrade_all_installed_packages.sh
```
