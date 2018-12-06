# api

## get user id per email address

```
GET: http://localhost/api/users/lookup?loginOrEmail=foo@bar.ru
```

## set new user password as admin

```
PUT: http://localhost/api/admin/users/:id/password
Content-Type: application/json
BODY: {"password":"new-password"}
```

# link

* [admin - password for user.](http://docs.grafana.org/http_api/admin/#password-for-user)
