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

## Backup TrueNAS to Synology NAS

[This](https://blog.filegarden.net/2021/02/24/backup-truenas-to-synology-via-rsync/) is the source of my howto

* We are creating a user on the synology and on the truenas, both need to have the same name!
* Login to your `synology`
    * Open `control center`
        * Click on `shared folders`
        * Click on `Create` and select `create shared folder`
            * Name: `<string: something useful containing the source host name like >>backup_for_myhost<<>`
            * Trashbin: `uncheck`
            * Click on `Next`
    * Open `control center`
        * Click on `user and groups`
        * Click `Create`
            * Name: `rsynctruenassynology`
            * Click on `Next`
            * Add the user to the group `administrators` (only with this group, he can ssh into the synology)
            * Click on `Next`
            * Set the right "read and write" for the directory you want to use as backup (the one you have created a few moments ago)
            * Click on `Next`
            * Allow usage of rsync
            * Click on `Next`
            * Click on `Next`
            * Click on `Finish`
    * Open `control center`
        * Click on `File Service`
        * Click on `rsync`
            * Check `enable rsync service`
            * Check `enable rsync account`
            * Click on `Edit rsync Account`
                * Click on `Add`
                * Select the user `rsynctruenassynology`
                    * Password can be a different one than the previously created user password
    * Open `control center`
        * Click on `user and groups`
        * Select `Advance`
        * Check `Enable user home service`
        * Click on `Apply`
* Open a terminal
    * `ssh rsynctruenassynology@<ip of the synology>`
    * `sudo vim /etc/ssh/sshd_config`
    * Enable `PubkeyAuthentication yes` by removing first character `#`
    * Enable `AuthorizedKeyfile .ssh/authorized_keys` by removing the first character `#`
    * `:wq`
* Login to your `synology`
    * Open `control center`
        * Open `Terminal & SNMP`
        * Stop and start `ssh service`
* Login to your truenas
    * Click on `Account` -> `User`
    * Click on `Add`
        * Username: `rsynctruenassynology`
        * The user needs to have the permission to read the data you want to backup
            * I am creating a dedicated home directory for the user
            * I am creating a dedicated "rsync" group that is used as group on the files I want to backup
* `ssh rsynctruenassynology@<ip address of your truenas>`
    * `mkdir .ssh`
    * `chmod 700 .ssh`
    * `cd .ssh`
    * `ssh-keygen -t rsa -b 4096`
        * Use default name
        * No Password
    * `chmod 400 id_rsa`
    * `chmod 400 id_rsa.pub`
    * `ssh-copy-id -i id_rsa.pub rsynctruenassynology@<ip of the synology>`
    * Test if ssh is working by `ssh -i .ssh/id_rsa rsynctruenassynology@<ip of the synology>`
        * You should not be asked for a password
* Login to your truenas
    * Click on `Tasks` -> `Rsync Tasks`
    * Click on `Add`
        * Select your source path
        * User `rsynctruenassynology`
        * Direction: `Push`
        * Set your schedule
        * Remote Host: `<ip of the synology>`
        * Rsync Mode: `SSH`
        * Remote SSH Port: `22`
        * Remote Path: `/volume1/<your_path>`
        * Check `Validate Remote Path`
        * Check `Times`
        * Uncheck `Compress`
        * `Send`
