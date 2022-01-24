# Synology

# HowTo

## Backup Synology NAS to TrueNAS

I've used [this](https://www.youtube.com/watch?v=WBH4L3My8NI) video from 15.11.2022 as source.

I've used a truenas 12.0-u7 and a synlogy `DS1815+` with `SDM 7.0.1-42218`.

If possible, ssh into the truenas and run `sudo tail -f /var/log/*.log` in a terminal while trying to setup the rsync.

* Login to your truenas
* We want to create a new user
* Go to `Accounts` -> `Users`
    * Click on `Add`
    * Create new user
        * Full Name: `<string: something usefull like <hostname>>`
        * Username: `<string: something usefull like <hostname>>`
        * Password: `<string: something usefull>`
        * New Primary Group: `checked`
        * Click on `SAVE`
* We want to create a new data set
* Go to `Storage` -> `Pools`
    * Click the three dots `...` on your preferred pool
    * Select `Add Dataset`
        * Name: `<string: something usefull describing your backup like >>backup_<hostname><<>`
        * Click on `SAVE`
    * Clock the three dots `...` on your newly created dataset
    * Select `Edit Permissions`
        * User: `<select your newly created user>`
        * Apply User: `checked`
        * Click on `SAVE`
* We want to enable the rsync service
* Go to `Services`
* We are in the line of `Rsync`
    * Move the slider to `Running`
    * Check the `Start Automatically` checkbox
    * Click on the `pen` symbole to go into the configuration dialoge
    * Select the tab `Rsync Module`
        * Click on `ADD`
        * Name: `<string: something usefull like >>backup_for_<hostname><<`
        * Comment: `<string: something usefull like which host should use this as a backup`
        * Path: `<select the path to the previously created data set>`
        * Access Mode: `Read and Write`
        * Maximum connection: `<int: 2 or 4>`
        * User: `<select the previously created user>`
        * Group: `<select the previously created user group>`
        * Host Allow: [`<string: input the hostname or ip address of your source host/synology>`]
        * Click on `SAVE`
* Login to your synology
* If needed, install `Hyper Backup`
* Start `Hyper Backup`
* Click on the little `plus` symbole in the lower left corner
    * Select `Data backup task`
    * Choose `rsync`
    * Server type: `rsync-compatible server`
    * Server name or IP address: `<string: hostname or ip address of your truenas>`
    * Transfer encryption: `Off`
    * Port: `873`
    * Username: `<string: your previously created true user name>`
    * Password: `<string: the password of your previously created true user name>`
    * Backup module: `<choose the previously created module name>`
    * Directory: `<should be set automatically>`
    * Click on `Next`
    * Select the data you want to backup
    * Click on `Next`
    * If needed, choose the application configuration you want to backup
    * Click on `Next`
    * Selet a runtime you want to
    * Optional: Enable client-side encryption
        * Password: `<string: the password of your previously created truenas user name>`
    * Click on `Next`
    * Click on `Apply`
    * Click on `Yes`
