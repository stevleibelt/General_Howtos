# Forgejo

## Switch from gitea to forgejo

```bash
# ref: https://forgejo.org/docs/latest/admin/gitea-migration/

# create a backup
./gitea dump

# stop gitea
supervisorctl stop gitea

# copy data
cp -r gitea forgejo
cp ~/etc/services.d/gitea.ini ~/etc/services.d/forgejo.ini
mv forgejo/data/gitea-repositories forgejo/data/forgejo-repositories

# remove old binaries
rm forgejo/gite*

# download forgejo
# **HINT**, check for latest version
wget -O forgejo/forgejo https://codeberg.org/forgejo/forgejo/releases/download/v8.0.0/forgejo-8.0.0-linux-amd64
chmod +x forgejo/forgejo
gpg --keyserver keys.openpgp.org --recv EB114F5E6C0DC2BCDD183550A4B61A2DC5923710
wget -O forgejo/forgejo.asc https://codeberg.org/forgejo/forgejo/releases/download/v8.0.0/forgejo-8.0.0-linux-amd64.asc
gpg --verify forgejo.asc forgejo

# adapt configuration file
# ref: https://forgejo.org/docs/latest/admin/upgrade/
# Mandatory Adaptation
#   WORK_PATH
#   Replace `MAILER_TYPE` with `PROTOCOL`
# Optional Adaptation
#   If you want to, you can copy the existing database to a new one and
#       adapt the database section
vim forgejo/custom/conf/app.ini

./forgejo/forgejo migrate

# fix all issues that are listed
./forgejo/forgejo doctor check

# change `autostart=yes` to `autostart=no`
vim ~/etc/services.d/forgejo.ini

# start forgejo
supervisorctl reread
supervisorctl update
supervisorctl start forgejo
supervisorctl status

# login and check if your acounts have access to all repositories etc.
# if all is fine
rm -fr gitea
rm -fr ~/etc/services.d/gitea.ini
supervisorctl reread
supervisorctl update
supervisorctl status
```
