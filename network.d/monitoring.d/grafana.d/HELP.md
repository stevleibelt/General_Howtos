# Grafana help section

## Set default Dashboard

* `User-Icon` -> `Profile`
* `Preferences`
* `Home Dashboard`
* Select your preferred dashboadd
* `Save`

## Reset Grafana Admin Password

Based on [this](https://community.grafana.com/t/how-do-i-reset-admin-password/76895) source.

```bash
# login to the fitting container

# See how grafana is started
ps aux | grep grafana

# Reset password
#  High chance you need to adapt/replace the homepath!
grafana-cli --homepath "/usr/share/grafana" admin reset-admin-password "<string: the_administrativ_password"
```

## Failed to save invite to database

```bash
# ref: https://github.com/grafana/grafana/issues/28871
sqlite3 grafana/data/grafana.db
# list pending user invitations - should be an expected result
SELECT * FROM temp_user;

# remove all pending invitations
DELETE FROM temp_user;

.exit
exit
```

