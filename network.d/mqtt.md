# MQTT

## mqttui

```bash
mqttui --broker mqtt://localhost:1883 --username my_user --password my_password
```

## eclipse mosquitto

```bash
# add password to config
echo "password_file /mosquitto/config_includes/passwd" > config_includes/my.conf

# encrypt a password file
mosquitto_passwd -U /mosquitto/config_includes/passwd
# create password file
mosquitto_passwd -c /mosquitto/config_includes/passwd user_name
# add a user
mosquitto_passwd -b /mosquitto/config_includes/passwd user_name pass_word
# delet a user
mosquitto_passwd -D /mosquitto/config_includes/passwd user_name
```
