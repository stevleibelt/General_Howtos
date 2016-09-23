# how to run teamviewer 10 on linux

```
#we are using the portable version
PATH_TO_THE_WINE="${HOME}/.wine/driver_c"
PATH_TO_THE_TEAMVIEWER_PORTABLE_VERSION="${PATH_TO_THE_WINE}/teamviewer_10_portable"

if [[ ! -d ${PATH_TO_THE_TEAMVIEWER_PORTABLE_VERSION} ]];
then
    TEMPORARY_PATH="/tmp/${USER}/teamviewer_10_portable"

    mkdir -p "${TEMPORARY_PATH}"
    cd "${TEMPORARY_PATH}"

    wget http://download.teamviewer.com/download/version_10x/TeamViewerPortable.zip
    unzip TeamViewerPortable.zip
    rm -fr TeamViewerPortable.zip

    mv teamviewer_10_portable "${PATH_TO_THE_WINE}"
fi

wine "${PATH_TO_THE_TEAMVIEWER_PORTABLE_VERSION}/TeamViewer.exe"
```
